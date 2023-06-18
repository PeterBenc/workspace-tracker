import { saveUtilWorkPeriodsToJson, saveWorkPeriodsToJson } from "../file";
import { parseLogPeriods } from "./logPeriod";
import { floorWorkPeriodsToMinute } from "./utils";
import {
  addPercentageToWorkPeriods,
  replaceShortBreakPeriods,
  groupShortWorkPeriods,
  parseWorkPeriods,
  mergeCloseWorkPeriods,
} from "./workPeriod";

export const parse = () => {
  const logPeriods = parseLogPeriods();
  const workPeriods = mergeCloseWorkPeriods(
    parseWorkPeriods(replaceShortBreakPeriods(logPeriods))
  );
  // const addedWorkPeriods = addPercentageToWorkPeriods(
  //   groupShortWorkPeriods(workPeriods),
  //   0.15
  // );
  // const aggregatedAddedWorkPeriods = groupShortWorkPeriods(addedWorkPeriods);
  // const flooredWorkPeriods = floorWorkPeriodsToMinute(
  //   aggregatedAddedWorkPeriods
  // );
  // saveUtilWorkPeriodsToJson(flooredWorkPeriods);
  saveWorkPeriodsToJson(workPeriods);
  return workPeriods;
};

parse();