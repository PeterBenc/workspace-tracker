import _ from "lodash";
import { WorkPeriod } from "./types";
import { aggregateTimeStats, getPeriodLength, secondsToTime } from "./utils";

export const getTimeSpentStats = (workPeriods: WorkPeriod[]) => {
  const workPeriodTimeStats = workPeriods.map(
    ({ ticker, endTime, startTime }) => ({
      ticker,
      timeStat: getPeriodLength(startTime, endTime),
    })
  );
  const workTimeSpendLogs = _(workPeriodTimeStats)
    .groupBy((x) => x.ticker)
    .map((x, ticker) => ({
      ticker,
      timeStat: secondsToTime(x.reduce((acc, prev) => acc + prev.timeStat, 0)),
    }))
    .value();
  console.log(workTimeSpendLogs);
  const { hours, seconds } = workTimeSpendLogs.reduce(
    (acc, curr) => ({
      hours: acc.hours + curr.timeStat.hours,
      seconds: acc.seconds + curr.timeStat.minutes * 60 + curr.timeStat.seconds,
    }),
    { hours: 0, seconds: 0 }
  );
  const totalTimeStats = aggregateTimeStats(
    { hours, minutes: 0, seconds: 0 },
    secondsToTime(seconds)
  );
  console.log(totalTimeStats);
};
