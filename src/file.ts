import fs from "fs";

export const appendToLogFile = (workspaceLogs: WorkspaceLog[]) => {
  fs.appendFileSync(
    "/home/peter/Me/workspace-tracker/logs.txt",
    workspaceLogs.map((log) => `${log.time}: ${log.workspaceName}`).join("\n")
  );
};
