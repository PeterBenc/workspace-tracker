import fs from "fs";
import { LOG_FILE_PATH } from "./constants";

export const appendToLogFile = (workspaceLogs: WorkspaceLog[]) => {
  fs.appendFileSync(
    LOG_FILE_PATH,
    `${workspaceLogs
      .map((log) => `${log.time}: ${log.workspaceName}`)
      .join("\n")}\n`
  );
};
