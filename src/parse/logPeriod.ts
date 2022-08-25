import fs from "fs";
import _ from "lodash";
import { LOG_INTERVAL, LOG_PARSE_FILE_PATH } from "../constants";
import { LogPeriod } from "./types";

export const parseLogPeriods = (): LogPeriod[] => {
  const logs: WorkspaceLog[] = fs
    .readFileSync(LOG_PARSE_FILE_PATH)
    .toString()
    .split("\n")
    .map((l) => {
      const log = l.split(": ");
      return { time: log[0], workspaceName: log[1] };
    })
    .filter((l) => !!l.time && !!l.workspaceName)
    .reduce((acc, curr, i, array) => {
      const nextItem = array[i + 1];
      const LOG_INTERVAL_SECONDS = LOG_INTERVAL / 1000;
      if (nextItem) {
        if (
          Number(nextItem.time) - Number(curr.time) >
          2 * LOG_INTERVAL_SECONDS
        ) {
          return [
            ...acc,
            curr,
            {
              time: String(Number(curr.time) + LOG_INTERVAL_SECONDS),
              workspaceName: "Sleep",
            },
          ];
        }
      }
      return [...acc, curr];
    }, [] as WorkspaceLog[]);

  let groupedLogs: LogPeriod[] = [];
  let logPeriod: LogPeriod = {
    workspaceName: logs[0].workspaceName,
    startTime: logs[0].time,
    endTime: "",
  };
  logs.forEach((l) => {
    if (l.workspaceName !== logPeriod.workspaceName) {
      groupedLogs.push({ ...logPeriod, endTime: l.time });
      // new log period
      logPeriod = {
        startTime: l.time,
        workspaceName: l.workspaceName,
        endTime: "",
      };
    }
  });
  groupedLogs.push({ ...logPeriod, endTime: logs[logs.length - 1].time });

  return groupedLogs;
};
