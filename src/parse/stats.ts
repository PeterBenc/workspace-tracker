import _ from "lodash";
import { WorkPeriod } from "./types";
import { getPeriodLength, secondsToTime } from "./utils";

export const getTimeSpentStats = (workPeriods: WorkPeriod[]) => {
  const workPeriodTimeStats = workPeriods.map(
    ({ ticker, endTime, startTime }) => ({
      ticker,
      timeStat: getPeriodLength(startTime, endTime),
    })
  );
  console.log(
    _(workPeriodTimeStats)
      .groupBy((x) => x.ticker)
      .map((x, ticker) => ({
        ticker,
        timeStat: secondsToTime(
          x.reduce((acc, prev) => acc + prev.timeStat, 0)
        ),
      }))
      .value()
  );
};
