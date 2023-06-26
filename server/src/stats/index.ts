import { WORK_PERIOD_FILE_PATH } from "../constants";
import { WorkPeriod } from "../parse/types";
import {
  getPreviousDayWorkPeriods,
  getTimeSpentByTicker,
  getTotalWorkPeriodTime,
} from "./utils";
import fs from "fs";

const getStats = () => {
  const workPeriods = (
    JSON.parse(
      fs.readFileSync(WORK_PERIOD_FILE_PATH, {
        encoding: "ascii",
      })
    ) as WorkPeriod[]
  ).filter(
    (wp) => new Date().getMonth() === new Date(wp.endTime * 1000).getMonth()
  );
  const mode = process.argv[2];
  switch (mode) {
    case "all":
      return console.log(getTotalWorkPeriodTime(workPeriods));
    case "ticket":
      return console.log(getTimeSpentByTicker(workPeriods));
    case "today":
      return getPreviousDayWorkPeriods(workPeriods);
    default:
      throw new Error("Invalid mode");
  }
};

getStats();
