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
};

export type LogTimeStat = {
  hours: number;
  minutes: number;
  seconds: number;
};
