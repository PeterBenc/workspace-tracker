import { LogTimeStat } from "./types";

export const formatTime = (time: string): string => {
  return new Date(Number(time) * 1000)
    .toISOString()
    .slice(0, 19)
    .replace("T", " ");
};

export function secondsToTime(secs: number): LogTimeStat {
  const hours = Math.floor(secs / (60 * 60));

  const divisor_for_minutes = secs % (60 * 60);
  const minutes = Math.floor(divisor_for_minutes / 60);

  const divisor_for_seconds = divisor_for_minutes % 60;
  const seconds = Math.ceil(divisor_for_seconds);

  return {
    hours,
    minutes,
    seconds,
  };
}

export const getPeriodLength = (startTime: string, endTime: string) => {
  return Number(endTime) - Number(startTime);
};

export const aggregateTimeStats = (
  timeStat1: LogTimeStat,
  timeStat2: LogTimeStat
) => {
  return {
    hours: timeStat1.hours + timeStat2.hours,
    minutes: timeStat1.minutes + timeStat2.minutes,
    seconds: timeStat1.minutes + timeStat2.minutes,
  };
};
