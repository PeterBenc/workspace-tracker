import { saveWorkPeriodsToJson } from "../file";
import { parseLogPeriods } from "./logPeriod";
import { getTimeSpentStats } from "./stats";
import { groupShortWorkPeriods, parseWorkPeriods } from "./workPeriod";

const parse = () => {
  const logPeriods = parseLogPeriods();
  const workPeriods = parseWorkPeriods(logPeriods);
  const aggregatedWorkPeriods = groupShortWorkPeriods(workPeriods);
  saveWorkPeriodsToJson(aggregatedWorkPeriods);
  getTimeSpentStats(aggregatedWorkPeriods);
};

parse();
