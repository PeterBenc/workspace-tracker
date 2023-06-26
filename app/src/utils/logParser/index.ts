import { floorWorkPeriodsToMinute } from "./utils";
import {
  addPercentageToWorkPeriods,
  groupShortWorkPeriods,
} from "./workPeriod";
import workPeriods from "../../work_periods.json";
import { WorkPeriod } from "./types";

export const parseWorkPeriods = () => {
  const x = workPeriods.filter(
    (wp) => new Date(wp.startTime * 1000).getMonth() === new Date().getMonth()
  );
  const addedWorkPeriods = addPercentageToWorkPeriods(
    groupShortWorkPeriods(x as WorkPeriod[]),
    0.15
  );
  const aggregatedAddedWorkPeriods = groupShortWorkPeriods(addedWorkPeriods);
  const flooredWorkPeriods = floorWorkPeriodsToMinute(
    aggregatedAddedWorkPeriods
  );
  return flooredWorkPeriods;
};
