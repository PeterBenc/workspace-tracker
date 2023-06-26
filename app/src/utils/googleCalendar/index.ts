import { REACT_APP_CALENDAR_ID, REACT_APP_GOOGLE_API_KEY } from "./constants";
import ApiCalendar from "react-google-calendar-api";
import { GoogleCalendarEvent } from "./types";
import { parseGoogleCalendarEvents } from "./utils";
import { WorkPeriod } from "../logParser/types";

const config = {
  clientId:
    "959330518129-psslk4kc2m083akcm0bcitj7m53br20g.apps.googleusercontent.com",
  apiKey: REACT_APP_GOOGLE_API_KEY,
  scope: "https://www.googleapis.com/auth/calendar",
  discoveryDocs: [
    "https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest",
  ],
};

const apiCalendar = new ApiCalendar(config);

const listEvents = (): WorkPeriod[] => {
  const timeMin = new Date();
  timeMin.setDate(1);
  timeMin.setUTCHours(0, 0, 0);
  timeMin.setMonth(new Date().getMonth());
  const timeMax = new Date();
  const currentMonth = new Date().getMonth();
  const nextMonth = currentMonth === 11 ? 0 : currentMonth + 2;
  timeMax.setMonth(nextMonth);
  timeMax.setDate(1);
  timeMax.setUTCHours(0, 0, 0);
  return apiCalendar
    .listEvents({
      calendarId: REACT_APP_CALENDAR_ID,
      timeMin: timeMin.toISOString(),
      timeMax: timeMax.toISOString(),
      showDeleted: true,
      maxResults: 500,
      singleEvents: true,
      orderBy: "startTime",
    })
    .then(({ result }) => result.items as GoogleCalendarEvent[])
    .then((items: GoogleCalendarEvent[]) => parseGoogleCalendarEvents(items));
};

export const googleCalendar = {
  handleAuth: apiCalendar.handleAuthClick,
  listEvents,
  onLoad: apiCalendar.onLoad,
};
