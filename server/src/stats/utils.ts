import _ from "lodash";
import { WorkPeriod } from "../parse/types";
import {
  aggregateTimeStats,
  getPeriodLength,
  secondsToTime,
} from "../parse/utils";

export const getTimeSpentByTicker = (workPeriods: WorkPeriod[]) => {
  const workPeriodTimeStats = workPeriods.map(
    ({ ticker, endTime, startTime, description }) => ({
      description,
      ticker,
      timeStat: getPeriodLength(startTime, endTime),
    })
  );
  return _(workPeriodTimeStats)
    .groupBy((x) => x.ticker)
    .map((x, ticker) => ({
      ticker,
      description: workPeriodTimeStats[0].description,
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

const getDayWorkPeriods = (workPeriods: WorkPeriod[], date: Date) => {
  return workPeriods
    .filter((wp) => {
      // filter work periods by month
      return (
        new Date(wp.startTime * 1000).getMonth() === date.getMonth() ||
        new Date(wp.endTime * 1000).getDate() === date.getMonth()
      );
    })
    .filter(
      // filter work periods by day
      (wp) =>
        new Date(wp.startTime * 1000).getDate() === date.getDate() ||
        new Date(wp.endTime * 1000).getDate() === date.getDate()
    );
};

const getPrettyWorkPeriods = (workPeriods: WorkPeriod[]) => {
  return workPeriods.map((wp) => {
    return {
      ...wp,
      startTime: new Date(wp.startTime * 1000).toTimeString().substring(0, 6),
      endTime:
        "  " + new Date(wp.endTime * 1000).toTimeString().substring(0, 6),
    };
  });
};

export const getPreviousDayWorkPeriods = (workPeriods: WorkPeriod[]) => {
  const previousWorkingDayDate = new Date(
    new Date().setDate(
      new Date().getDate() - (new Date().getDate() === 0 ? 3 : 1)
    )
  );
  const lastDayWorkPeriods = getDayWorkPeriods(
    workPeriods,
    previousWorkingDayDate
  );
  console.log(`Last working day: ${previousWorkingDayDate.toDateString()}`);
  console.log(getPrettyWorkPeriods(lastDayWorkPeriods));
  console.log(getTotalWorkPeriodTime(lastDayWorkPeriods));

  console.log(`Today: ${new Date().toDateString()}`);
  const todaysWorkPeriods = getDayWorkPeriods(workPeriods, new Date());
  console.log(getPrettyWorkPeriods(todaysWorkPeriods));
  console.log(getTotalWorkPeriodTime(todaysWorkPeriods));
};
