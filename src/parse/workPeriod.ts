import _ from "lodash";
import { MINIMAL_WORK_PERIOD_LENGTH } from "../constants";
import { getTimeSpentByTicker, getTotalWorkPeriodTime } from "./stats";
import { LogPeriod, WorkPeriod } from "./types";
import { getDayFromTime, getWorkPeriodDuration, secondsToTime } from "./utils";

const isTicker = (workspaceName: string) => {
  return workspaceName.startsWith("t-") || workspaceName.startsWith("r-");
};

const parseTicker = (workspaceName: string) => {
  const [type, id, ticker] = workspaceName.split("-");
  return {
    ticker: `${ticker || "ADLT"}-${id}`,
    description: type === "r" ? "review" : "dev",
  };
};

export const parseWorkPeriods = (logPeriods: LogPeriod[]): WorkPeriod[] => {
  return logPeriods
    .filter(({ workspaceName }) => isTicker(workspaceName))
    .map(({ startTime, endTime, workspaceName }) => ({
      startTime,
      endTime,
      ...parseTicker(workspaceName),
    }));
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
      longDayWorkPeriods[longDayWorkPeriods.length - 1].endTime;
    const aggregatedShortWorkPeriods = Object.entries(
      groupedShortDayWorkPeriods
    ).reduce((acc, [key, value], i) => {
      const totalDuration = value.reduce(
        (a, c) => a + getWorkPeriodDuration(c),
        0
      );
      const startTime = lastWorkDayPeriodEnd;
      const endTime = String(Number(startTime) + totalDuration);
      lastWorkDayPeriodEnd = endTime;
      return [
        ...acc,
        { ticker: key, startTime, endTime, description: value[0].description },
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
      const startTime = String(lastDayLogEndTime);
      const endTime = String(Number(startTime) + totalDuration);
      const aggregatedWorkPeriod = {
        ticker: key,
        startTime,
        endTime,
        description: value[value.length - 1].description,
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
      startTime: lastDayLogEndTime.toString(),
      endTime: (lastDayLogEndTime + addedTime.addedSeconds).toString(),
      description: addedTime.description,
    });
  });
  return addedWorkPeriods;
};
