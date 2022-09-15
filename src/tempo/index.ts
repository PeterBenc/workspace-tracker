import { parse } from "../parse";
import { WorkPeriod } from "../parse/types";
import { TempoWorkLog } from "./types";

const jiraUri = "https://vacuum.atlassian.net/jira";
const apiToken = "B5njNBix8LBEDWmwDlplE8XUbsQv5y";
const userName = "peter.benc";
const password = "Abpb6789wistA";

const createCurl = (data: TempoWorkLog) => {
  return `curl -D- -H "Authorization: Bearer ${apiToken}}" --request POST --url ${jiraUri}/rest/tempo-timesheets/4/worklogs/ --header 'Content-Type: application/json' --data '${JSON.stringify(
    data
  )}' >> worklog_response.json`;
};

const workPeriodToTempoLog = (workPeriod: WorkPeriod): TempoWorkLog => {
  return {
    worker: "peter.benc",
    comment: workPeriod.description,
    started: new Date(Number(workPeriod.startTime) * 1000).toISOString(), //"2018-11-01T09:00:00.000",
    timeSpentSeconds: Number(workPeriod.endTime) - Number(workPeriod.startTime), // 7200,
    originTaskId: workPeriod.ticker, // "12690",
  };
};

export const submitWorkPeriodsToTempo = () => {
  const logs = parse();
  const logToSubmit = workPeriodToTempoLog(logs[0]);
  console.log(createCurl(logToSubmit));
};

submitWorkPeriodsToTempo();
