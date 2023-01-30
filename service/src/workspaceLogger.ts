import { LOG_BATCH_SIZE, LOG_INTERVAL } from "./constants";
import { IWorkspaceLogger, WorkspaceLog } from "./types";
import { sleep } from "./utils";
import fs from "fs";
import { LOG_FILE_PATH } from "./constants";
import { execSync } from "child_process";

export class WorkspaceLogger implements IWorkspaceLogger {
  public shouldLog = () => {
    try {
      // check if the screen saver is turned on, if yes, do not log
      return execSync("gnome-screensaver-command -q")
        .toString()
        .startsWith("The screensaver is inactive");
    } catch (e) {
      return true;
    }
  };

  public getCurrentWorkspace = (): WorkspaceLog => {
    const workspaceNames = JSON.parse(
      `${execSync(
        "gsettings get org.gnome.desktop.wm.preferences workspace-names"
      )
        .toString()
        .replace(/'/g, '"')}`
    ) as string[];
    const workspaceIndex = Number(
      execSync(
        "export DISPLAY=:0 && export XAUTHORITY=/home/peter/.Xauthority && xdotool get_desktop"
      ).toString()
    );
    return {
      time: Math.round(Date.now() / 1000).toString(),
      workspaceName: `${
        workspaceNames.find((wk, i) => i === workspaceIndex) || "Unknown"
      }`,
    };
  };

  public appendToLogFile = (workspaceLogs: WorkspaceLog[]): void => {
    fs.appendFileSync(
      LOG_FILE_PATH,
      `${workspaceLogs
        .map((log) => `${log.time}: ${log.workspaceName}`)
        .join("\n")}\n`
    );
  };

  public logWorkspaces = async (): Promise<void> => {
    let workspaceLogs: WorkspaceLog[] = [];
    while (true) {
      if (this.shouldLog()) {
        workspaceLogs.push(this.getCurrentWorkspace());
      }
      if (workspaceLogs.length === LOG_BATCH_SIZE) {
        this.appendToLogFile(workspaceLogs);
        workspaceLogs = [];
      }
      await sleep(LOG_INTERVAL);
    }
  };
}
