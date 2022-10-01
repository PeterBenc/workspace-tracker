import fs from "fs";
import {
  LOG_FILE_PATH,
  WORK_PERIOD_FILE_PATH,
  WORK_PERIOD_MANUAL_LOG_FILE_PATH,
} from "./constants";
import { WorkPeriod } from "./parse/types";

export const appendToLogFile = (workspaceLogs: WorkspaceLog[]) => {
  fs.appendFileSync(
    LOG_FILE_PATH,
    `${workspaceLogs
      .map((log) => `${log.time}: ${log.workspaceName}`)
      .join("\n")}\n`
  );
};

export const saveWorkPeriodsToJson = (workLogs: WorkPeriod[]) => {
  let data = JSON.stringify(workLogs);
  fs.writeFileSync(WORK_PERIOD_FILE_PATH, data);
};

// just for manual logging
export const saveUtilWorkPeriodsToJson = (workLogs: WorkPeriod[]) => {
  const utilWorkLogs = workLogs.map((wp) => ({
    date: new Date(Number(wp.startTime) * 1000).getDate(),
    startTime: new Date((Number(wp.startTime) + 0 * 3600) * 1000)
      .toTimeString()
      .replace(":00 GMT-0700 (Pacific Daylight Time)", ""),
    endTime: new Date((Number(wp.endTime) + 0 * 3600) * 1000)
      .toTimeString()
      .replace(":00 GMT-0700 (Pacific Daylight Time)", ""),
    ticker: wp.ticker,
    description: wp.description,
  }));
  let data = JSON.stringify(utilWorkLogs);
  fs.writeFileSync(WORK_PERIOD_MANUAL_LOG_FILE_PATH, data);
};
