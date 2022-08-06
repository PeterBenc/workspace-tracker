import { parseLogPeriods } from "./logPeriod";
import { getTimeSpentStats } from "./stats";
import { parseWorkPeriods } from "./workPeriod";

const parse = () => {
  const logPeriods = parseLogPeriods();
  const workPeriods = parseWorkPeriods(logPeriods);
  getTimeSpentStats(workPeriods);
};

parse();
