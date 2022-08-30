import _ from "lodash";
import { MINIMAL_WORK_PERIOD_LENGTH } from "../constants";
import { LogPeriod, WorkPeriod } from "./types";
import { getDayFromTime, getWorkPeriodDuration } from "./utils";

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
      return [...acc, { ticker: key, startTime, endTime }];
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
  const monthGroupedShortWorkPeriods = Object.entries(
    _.groupBy(shortMonthWorkPeriods, (wp) => wp.ticker)
  ).reduce((acc, [key, value]) => {
    const totalDuration = value.reduce(
      (a, c) => a + getWorkPeriodDuration(c),
      0
    );
    const x = new Date(Number(value[value.length - 1].startTime) * 1000);
    const y = x.setHours(3);
    const startTime = String(x.getTime() / 1000);
    const endTime = String(Number(startTime) + totalDuration);
    return [...acc, { ticker: key, startTime, endTime }];
  }, [] as WorkPeriod[]);
  return [...longWorkPeriods, ...monthGroupedShortWorkPeriods];
};

const ceilTimeToMinute = (time: number) => {
  return Math.ceil(time / 60) * 60;
};

const floorTimeToMinute = (time: number) => {
  return Math.floor(time / 60) * 60;
};

// ceil all logs to minute, maybe you want to do that in `logPeriod.ts` not here
