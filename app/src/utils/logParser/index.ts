import { floorWorkPeriodsToMinute } from "./utils";
import {
  addPercentageToWorkPeriods,
  groupShortWorkPeriods,
  mergeCloseWorkPeriods,
  parseWorkPeriods,
  replaceShortBreakPeriods,
} from "./workPeriod";
import { WorkPeriod } from "./types";
import { parseLogPeriods } from "./logPeriod";
import {
  MERGE_MINIMAL_WORK_PERIOD_LENGTH,
  MERGE_MAX_WORK_PERIOD_BREAK,
} from "./constants";
// @ts-ignore
import logs_copy from "../../logs_copy.txt";

const getLogPeriods = async (): Promise<string> => {
  return fetch(logs_copy).then((r) => r.text());
};

export const parseLogs = async () => {
  const logPeriods = parseLogPeriods(await getLogPeriods());
  const workPeriods = mergeCloseWorkPeriods(
    parseWorkPeriods(
      replaceShortBreakPeriods(logPeriods, MERGE_MAX_WORK_PERIOD_BREAK)
    ),
    MERGE_MINIMAL_WORK_PERIOD_LENGTH,
    MERGE_MAX_WORK_PERIOD_BREAK
  );
  const addedWorkPeriods = addPercentageToWorkPeriods(
    groupShortWorkPeriods(workPeriods as WorkPeriod[]),
    0.15
  );
  const aggregatedAddedWorkPeriods = groupShortWorkPeriods(addedWorkPeriods);
  const flooredWorkPeriods = floorWorkPeriodsToMinute(
    aggregatedAddedWorkPeriods
  );
  return flooredWorkPeriods.filter(
    (wp) => new Date(wp.startTime * 1000).getMonth() === new Date().getMonth()
  );
};
