export type LogPeriod = {
  workspaceName: string;
  startTime: number;
  endTime: number;
};

export type WorkPeriod = {
  ticker: string;
  startTime: number;
  endTime: number;
  description: string;
  type: "tracked" | "added" | "aggregated" | "calendar";
};

export type LogTimeStat = {
  hours: number;
  minutes: number;
  seconds: number;
};

export type WorkspaceLog = {
  time: string;
  workspaceName: string;
};
