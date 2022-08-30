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
  const workPeriodsByDay = _.groupBy(workPeriods, (wp) =>
    getDayFromTime(Number(wp.startTime))
  );
  return Object.values(workPeriodsByDay)
    .map((wp) => {
      const longWorkPeriods = wp.filter(
        (p) => getWorkPeriodDuration(p) >= MINIMAL_WORK_PERIOD_LENGTH
      );
      const shortWorkPeriods = wp.filter(
        (p) => getWorkPeriodDuration(p) < MINIMAL_WORK_PERIOD_LENGTH
      );
      const groupedShortPeriods = _.groupBy(shortWorkPeriods, (p) => p.ticker);
      let lastWorkPeriodEnd =
        longWorkPeriods[longWorkPeriods.length - 1].endTime;
      const aggregatedWorkPeriods = Object.entries(groupedShortPeriods).reduce(
        (acc, [key, value], i) => {
          const totalDuration = value.reduce(
            (a, c) => a + getWorkPeriodDuration(c),
            0
          );
          if (totalDuration < MINIMAL_WORK_PERIOD_LENGTH) {
            return acc;
          }
          const startTime = lastWorkPeriodEnd;
          const endTime = String(Number(startTime) + totalDuration);
          lastWorkPeriodEnd = endTime;
          return [...acc, { ticker: key, startTime, endTime }];
        },
        [] as WorkPeriod[]
      );
      return [...longWorkPeriods, ...aggregatedWorkPeriods];
    })
    .flat();
};

const ceilTimeToMinute = (time: number) => {
  return Math.ceil(time / 60) * 60;
};

const floorTimeToMinute = (time: number) => {
  return Math.floor(time / 60) * 60;
};

// ceil all logs to minute, maybe you want to do that in `logPeriod.ts` not here
