import fs from "fs";
import _ from "lodash";
import { LogPeriod } from "./types";

export const parseLogPeriods = (): LogPeriod[] => {
  const logs: WorkspaceLog[] = fs
    .readFileSync("/home/peter/Me/workspace-tracker/logs_backup.txt")
    .toString()
    .split("\n")
    .map((l) => {
      const log = l.split(": ");
      return { time: log[0], workspaceName: log[1] };
    })
    .filter((l) => !!l.time && !!l.workspaceName);

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
