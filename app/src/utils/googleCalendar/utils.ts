import { WorkPeriod } from "../logParser/types";
import { GoogleCalendarEvent } from "./types";

export const parseGoogleCalendarEvents = (
  events: GoogleCalendarEvent[]
): WorkPeriod[] => {
  return events
    .filter((e) => e.end.dateTime && e.start.dateTime)
    .filter((e) => {
      const myResponseStatus = e.attendees?.find(
        (a) => a.self === true
      )?.responseStatus;
      return myResponseStatus === "accepted" || e.creator.self === true;
    })
    .map((e) => {
      const taskInName = e.summary.match(/[A-Z]{2,5}-[0-9]{1,5}/);
      const taskInDescription = (e.description || "").match(
        /[A-Z]{2,5}-[0-9]{1,5}/
      );
      return {
        ...e,
        summary: `${e.summary} (${taskInDescription || taskInName})`,
        id: taskInDescription || taskInName || "",
      };
    })
    .filter((e) => {
      return !!e.summary.match(/[A-Z]{2,5}-[0-9]{1,5}/);
    })
    .map((e) => {
      return {
        endTime: Math.floor(new Date(e.end.dateTime).getTime() / 1000),
        startTime: Math.floor(new Date(e.start.dateTime).getTime() / 1000),
        description: e.summary,
        ticker: e.id,
        type: "calendar",
      } as WorkPeriod;
    });
};
