import fs from "fs";
import { LOG_FILE_PATH, WORK_PERIOD_FILE_PATH } from "./constants";
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
