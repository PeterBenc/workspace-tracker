import { getCurrentWorkspace } from "./cli";
import { appendToLogFile } from "./file";
import { sleep } from "./utils";

let workspaceLogs: WorkspaceLog[] = [];

export const logWorkspaces = async () => {
  while (true) {
    workspaceLogs.push(getCurrentWorkspace());
    if (workspaceLogs.length === 1) {
      appendToLogFile(workspaceLogs);
      workspaceLogs = [];
    }
    await sleep(2000);
  }
};
