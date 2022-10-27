export type GoogleCalendarEvent = {
  attendees: [
    {
      email: string; // "richard.izip@vacuumlabs.com",
      organizer: true | undefined;
      self: true | undefined;
      responseStatus: string; // "accepted",
    }
  ];
  kind: string; // "calendar#event";
  etag: string; // '"3269775326963000"';
  id: string; // "3c3o6v16dnd4f17kg63coc6rfn";
  status: string; // "confirmed";
  htmlLink: string; // "https://www.google.com/calendar/event?eid=M2MzbzZ2MTZkbmQ0ZjE3a2c2M2NvYzZyZm5fMjAyMTEwMjJUMDkzMDAwWiBwZXRlci5iZW5jQHZhY3V1bWxhYnMuY29t";
  created: string; // "2021-10-22T07:27:10.000Z";
  updated: string; // "2021-10-22T07:27:43.508Z";
  summary: string; //  "Lunch";
  creator: {
    email: string; //  "peter.benc@vacuumlabs.com";
    self: boolean;
  };
  organizer: {
    email: string; // "peter.benc@vacuumlabs.com";
    self: boolean;
  };
  start: {
    dateTime: string; // "2021-10-22T11:30:00+02:00";
    timeZone: string; // "Europe/Prague";
  };
  end: {
    dateTime: string; //  "2021-10-22T12:30:00+02:00";
    timeZone: string; // "Europe/Prague";
  };
  recurrence: string[]; // ["RRULE:FREQ=WEEKLY;BYDAY=FR,MO,TH,TU,WE"];
  iCalUID: string; // "3c3o6v16dnd4f17kg63coc6rfn@google.com";
  sequence: number; // 1;
  reminders: {
    useDefault: boolean;
  };
  description?: string; //
  eventType: "default";
};
