export type LogPeriod = {
  workspaceName: string;
  startTime: string;
  endTime: string;
};

export type WorkPeriod = {
  ticker: string;
  startTime: string;
  endTime: string;
  description: string;
};

export type LogTimeStat = {
  hours: number;
  minutes: number;
  seconds: number;
};
