import { saveWorkPeriodsToJson } from "../file";
import { parseLogPeriods } from "./logPeriod";
import { getTimeSpentStats } from "./stats";
import { floorWorkPeriodsToMinute } from "./utils";
import {
  addPercentageToWorkPeriods,
  groupShortWorkPeriods,
  parseWorkPeriods,
} from "./workPeriod";

export const parse = () => {
  const logPeriods = parseLogPeriods();
  const workPeriods = parseWorkPeriods(logPeriods);
  const addedWorkPeriods = addPercentageToWorkPeriods(
    groupShortWorkPeriods(workPeriods),
    0.15
  );
  const aggregatedAddedWorkPeriods = groupShortWorkPeriods(addedWorkPeriods);
  const flooredWorkPeriods = floorWorkPeriodsToMinute(
    aggregatedAddedWorkPeriods
  );
  saveWorkPeriodsToJson(flooredWorkPeriods);
  getTimeSpentStats(flooredWorkPeriods);
  return flooredWorkPeriods;
};

parse();
