import { getCurrentWorkspace } from "./cli";
import { LOG_BATCH_SIZE, LOG_INTERVAL } from "./constants";
import { appendToLogFile } from "./file";
import { WorkspaceLog } from "./types";
import { sleep } from "./utils";

let workspaceLogs: WorkspaceLog[] = [];

export const logWorkspaces = async () => {
  while (true) {
    workspaceLogs.push(getCurrentWorkspace());
    if (workspaceLogs.length === LOG_BATCH_SIZE) {
      appendToLogFile(workspaceLogs);
      workspaceLogs = [];
    }
    await sleep(LOG_INTERVAL);
  }
};
