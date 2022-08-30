import _ from "lodash";
import { WorkPeriod } from "./types";
import { aggregateTimeStats, getPeriodLength, secondsToTime } from "./utils";

export const getTimeSpentByTicker = (workPeriods: WorkPeriod[]) => {
  const workPeriodTimeStats = workPeriods.map(
    ({ ticker, endTime, startTime }) => ({
      ticker,
      timeStat: getPeriodLength(startTime, endTime),
    })
  );
  return _(workPeriodTimeStats)
    .groupBy((x) => x.ticker)
    .map((x, ticker) => ({
      ticker,
      timeStat: secondsToTime(x.reduce((acc, prev) => acc + prev.timeStat, 0)),
    }))
    .value();
};

export const getTotalWorkPeriodTime = (workPeriods: WorkPeriod[]) => {
  const timeSpentByTicker = getTimeSpentByTicker(workPeriods);
  const { hours, seconds } = timeSpentByTicker.reduce(
    (acc, curr) => ({
      hours: acc.hours + curr.timeStat.hours,
      seconds: acc.seconds + curr.timeStat.minutes * 60 + curr.timeStat.seconds,
    }),
    { hours: 0, seconds: 0 }
  );
  return aggregateTimeStats(
    { hours, minutes: 0, seconds: 0 },
    secondsToTime(seconds)
  );
};

export const getTimeSpentStats = (workPeriods: WorkPeriod[]) => {
  const timeSpentByTicker = getTimeSpentByTicker(workPeriods);
  console.log(timeSpentByTicker);
  const totalTimeSpent = getTotalWorkPeriodTime(workPeriods);
  console.log(totalTimeSpent);
};
