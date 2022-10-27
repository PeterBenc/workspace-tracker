import { CalendarEvent } from "kalend";
import { GoogleCalendarEvent } from "./types";

export const parseGoogleCalendarEvents = (
  events: GoogleCalendarEvent[]
): CalendarEvent[] => {
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
      };
    })
    .map((e) => {
      console.log(e);
      console.log(e.summary, e.description);
      return {
        id: e.id,
        // startAt: e.start.dateTime,
        // endAt: e.end.dateTime,
        startAt: new Date(e.start.dateTime).toISOString(),
        endAt: new Date(e.end.dateTime).toISOString(),
        timezoneStartAt: "Europe/Berlin", // optional
        timezoneEndAt: "Europe/Berlin",
        summary: e.summary,
        color: "red",
        calendarID: "work",
      } as CalendarEvent;
    })
    .filter((e) => {
      return !!e.summary.match(/[A-Z]{2,5}-[0-9]{1,5}/);
    });
};
