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

// TODO: design a pattern for logs transformations, maybe
// it could be recursion of sorts, we could in theory define transformations in array and
// then just call all of them on the initial log string
// these transformations are kind of arbitrary, so there should be a easy way to reshuffle them
// maybe each transformation should return {type: 'some_name', data: TData, transform: () => ReturnType<TNextTransformFn>}
// maybe, anyway, the problem is that the current transformations are quite messy and it it quite hard
// to know what they actually do with the data and in which order they should be called

// TODO: restart service every day, this what ever happens with it, it should work, or lets say
// restart it every day after logging in ( this will be harder to do tho)

export const parseLogs = async () => {
  const logPeriods = parseLogPeriods(await getLogPeriods()).filter(
    (lp) => new Date(lp.startTime * 1000).getMonth() === new Date().getMonth()
  );
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
  return flooredWorkPeriods;
};
