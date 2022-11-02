import _ from "lodash";
import { MINIMAL_WORK_PERIOD_LENGTH } from "../constants";
import { getTimeSpentByTicker } from "../stats/utils";
import { LogPeriod, WorkPeriod } from "./types";
import {
  getDayFromTime,
  getPeriodLength,
  getWorkPeriodDuration,
} from "./utils";

const isTicker = (workspaceName: string) => {
  return workspaceName.startsWith("t-") || workspaceName.startsWith("r-");
};

const parseTicker = (workspaceName: string) => {
  const [type, id, ticker] = workspaceName.split("-");
  const jiraTickerId = `${ticker || "ADLT"}-${id}`;
  return {
    ticker: jiraTickerId,
    description: type === "r" ? `Review` : `Dev`,
  };
};

export const parseWorkPeriods = (logPeriods: LogPeriod[]): WorkPeriod[] => {
  return logPeriods
    .filter(({ workspaceName }) => isTicker(workspaceName))
    .map(({ startTime, endTime, workspaceName }) => ({
      startTime,
      endTime,
      type: "tracked",
      ...parseTicker(workspaceName),
    }));
};

// takes pauses between work periods which are shorter than 5 minutes and converts them to work periods
export const replaceShortBreakPeriods = (
  logPeriods: LogPeriod[]
): LogPeriod[] => {
  const convertedLogPeriods: LogPeriod[] = [];
  logPeriods.forEach((lp, i, lps) => {
    if (i > 0) {
      const isWorkPeriod = isTicker(lp.workspaceName);
      if (isWorkPeriod) {
        const previousPeriod = lps[i - 1];
        const isWorkPeriod2 = isTicker(previousPeriod.workspaceName);
        if (!isWorkPeriod2) {
          if (
            getPeriodLength(previousPeriod.startTime, previousPeriod.endTime) <
            5 * 60 // 5 minutes
          ) {
            convertedLogPeriods.push({
              ...previousPeriod,
              workspaceName: lp.workspaceName,
            });
          }
        }
      }
    }
  });
  return logPeriods.map((lp) => {
    const matchingLogPeriod = convertedLogPeriods.find(
      (clp) => clp.startTime === lp.startTime && clp.endTime === lp.endTime
    );
    return matchingLogPeriod || lp;
  });
};

export const mergeCloseWorkPeriods = (
  workPeriods: WorkPeriod[]
): WorkPeriod[] => {
  const toBeMerged: WorkPeriod[][] = [];
  let wpGroup: WorkPeriod[] = [{ ...workPeriods[0] }];
  let previousWp: WorkPeriod = { ...workPeriods[0] };
  workPeriods.slice(1).forEach((wp) => {
    if (
      getPeriodLength(wp.startTime, wp.endTime) > 5 * 60 && // merge only periods longer than 5 min
      getPeriodLength(previousWp.endTime, wp.startTime) < 5 * 60 &&
      previousWp.ticker === wp.ticker
    ) {
      wpGroup.push(wp);
    } else {
      toBeMerged.push([...wpGroup]);
      wpGroup = [{ ...wp }];
    }
    previousWp = { ...wp };
  });

  return toBeMerged.flatMap((wps) => {
    const firstLog = wps[0];
    const lastLog = wps[wps.length - 1];
    const mergedLog: WorkPeriod = {
      ...firstLog,
      endTime: lastLog.endTime,
    };
    return mergedLog;
  });
};

export const groupShortWorkPeriods = (workPeriods: WorkPeriod[]) => {
  // group work logs by day
  const dayGroupedWorkPeriods = Object.values(
    _.groupBy(workPeriods, (wp) => getDayFromTime(Number(wp.startTime)))
  ).map((wp) => {
    // filter out too short work periods
    const longDayWorkPeriods = wp.filter(
      (p) => getWorkPeriodDuration(p) >= MINIMAL_WORK_PERIOD_LENGTH
    );
    const shortDayWorkPeriods = wp.filter(
      (p) => getWorkPeriodDuration(p) < MINIMAL_WORK_PERIOD_LENGTH
    );
    const groupedShortDayWorkPeriods = _.groupBy(
      shortDayWorkPeriods,
      (p) => p.ticker
    );

    // aggregate too short work periods into one
    let lastWorkDayPeriodEnd =
      longDayWorkPeriods[longDayWorkPeriods.length - 1]?.endTime;
    const aggregatedShortWorkPeriods = Object.entries(
      groupedShortDayWorkPeriods
    ).reduce((acc, [key, value], i) => {
      const totalDuration = value.reduce(
        (a, c) => a + getWorkPeriodDuration(c),
        0
      );
      const startTime = lastWorkDayPeriodEnd;
      const endTime = startTime + totalDuration;
      lastWorkDayPeriodEnd = endTime;
      return [
        ...acc,
        {
          ticker: key,
          startTime,
          endTime,
          description: value[0].description,
          type: "aggregated",
        } as WorkPeriod,
      ];
    }, [] as WorkPeriod[]);

    const aggregatedShortDayWorkPeriods = aggregatedShortWorkPeriods.filter(
      (wp) => getWorkPeriodDuration(wp) >= MINIMAL_WORK_PERIOD_LENGTH
    );
    const ultraShortDayWorkPeriods = aggregatedShortWorkPeriods.filter(
      (wp) => getWorkPeriodDuration(wp) < MINIMAL_WORK_PERIOD_LENGTH
    );

    return {
      dayWorkPeriods: [...longDayWorkPeriods, ...aggregatedShortDayWorkPeriods],
      ultraShortDayWorkPeriods,
    };
  });

  const longWorkPeriods = dayGroupedWorkPeriods.flatMap(
    (wps) => wps.dayWorkPeriods
  );
  const shortMonthWorkPeriods = dayGroupedWorkPeriods.flatMap(
    (wps) => wps.ultraShortDayWorkPeriods
  );

  // group short logs by month
  Object.entries(_.groupBy(shortMonthWorkPeriods, (wp) => wp.ticker)).forEach(
    ([key, value]) => {
      const totalDuration = value.reduce(
        (a, c) => a + getWorkPeriodDuration(c),
        0
      );
      // log monthly short logs at the their last log day as the last log of the day
      const workPeriodLastLogTime = new Date(
        Number(value[value.length - 1].startTime) * 1000
      );
      const workPeriodLastDay = workPeriodLastLogTime.getDate();
      const workPeriodsByDay = _.groupBy(longWorkPeriods, (wp) =>
        getDayFromTime(Number(wp.startTime))
      );
      const lastDayLogEndTime = Math.max(
        ...workPeriodsByDay[workPeriodLastDay].map((wp) => Number(wp.endTime))
      );
      const startTime = lastDayLogEndTime;
      const endTime = startTime + totalDuration;
      const aggregatedWorkPeriod: WorkPeriod = {
        ticker: key,
        startTime,
        endTime,
        description: value[value.length - 1].description,
        type: "aggregated",
      };
      if (
        // ignore still too short work periods
        getWorkPeriodDuration(aggregatedWorkPeriod) >=
        MINIMAL_WORK_PERIOD_LENGTH
      ) {
        longWorkPeriods.push(aggregatedWorkPeriod);
      }
    },
    [] as WorkPeriod[]
  );
  return longWorkPeriods;
};

export const addPercentageToWorkPeriods = (
  workPeriods: WorkPeriod[],
  coefficient: number
) => {
  const timeSpentByTicker = getTimeSpentByTicker(workPeriods);
  const addedTimeByTicker = timeSpentByTicker.map(
    ({ ticker, timeStat, description }) => {
      const { hours, minutes, seconds } = timeStat;
      const tickerTimeInSeconds = hours * 60 * 60 + minutes * 60 + seconds;
      const addedSeconds = tickerTimeInSeconds * coefficient;
      return { ticker, addedSeconds, description };
    }
  );

  const addedWorkPeriods = [...workPeriods];
  addedTimeByTicker.forEach((addedTime) => {
    const lastWorkPeriodDate = new Date(
      Math.min(
        ...addedWorkPeriods
          .filter((wp) => wp.ticker === addedTime.ticker)
          .map((wp) => Number(wp.endTime))
      ) * 1000
    ).getDate();
    const workPeriodsByDay = _.groupBy(addedWorkPeriods, (wp) =>
      getDayFromTime(Number(wp.startTime))
    );
    const lastDayLogEndTime = Math.max(
      ...workPeriodsByDay[lastWorkPeriodDate].map((wp) => Number(wp.endTime))
    );
    addedWorkPeriods.push({
      ticker: addedTime.ticker,
      startTime: lastDayLogEndTime,
      endTime: lastDayLogEndTime + addedTime.addedSeconds,
      description: addedTime.description,
      type: "added",
    });
  });
  return addedWorkPeriods;
};
