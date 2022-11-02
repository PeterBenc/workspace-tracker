import { WorkPeriod } from "../logParser/types";
import { FinetrackerWorklog } from "./types";

export const workPeriodToFinetrackerWorklog = (
  id: number,
  wp: WorkPeriod
): FinetrackerWorklog => {
  return {
    id,
    synced: false,
    comment: wp.description,
    issue: wp.ticker,
    freeTime: false,
    timeSpentSeconds: wp.endTime - wp.startTime,
    dateStarted: new Date(wp.startTime * 1000).toISOString(),
    durationLabel: "15min",
  };
};
