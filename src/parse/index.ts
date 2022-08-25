import { saveWorkPeriodsToJson } from "../file";
import { parseLogPeriods } from "./logPeriod";
import { getTimeSpentStats } from "./stats";
import { parseWorkPeriods } from "./workPeriod";

const parse = () => {
  const logPeriods = parseLogPeriods();
  const workPeriods = parseWorkPeriods(logPeriods);
  saveWorkPeriodsToJson(workPeriods);
  console.log(workPeriods);
  getTimeSpentStats(workPeriods);
};

parse();
