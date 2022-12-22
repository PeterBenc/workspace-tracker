export type WorkspaceLog = {
  time: string;
  workspaceName: string;
};

export interface IWorkspaceLogger {
  getCurrentWorkspace: () => WorkspaceLog;
  appendToLogFile: (workspaceLogs: WorkspaceLog[]) => void;
  logWorkspaces: () => Promise<void>;
}
