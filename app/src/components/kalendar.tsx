import React, { useEffect, useState } from "react";
import Kalend, { CalendarEvent, CalendarView, CALENDAR_VIEW } from "kalend";
import "kalend/dist/styles/index.css";
import { WorkPeriod } from "../utils/logParser/types";
import { workPeriodToFinetrackerWorklog } from "../utils/fineTrackerSubmiter";
import _ from "lodash";

const Kalendar = ({
  workPeriods,
  kalendRef,
  onStateChange,
  selectedView,
}: {
  workPeriods: WorkPeriod[];
  kalendRef?: unknown;
  onStateChange?: unknown;
  selectedView?: CALENDAR_VIEW | undefined;
}) => {
  const [events, setEvents] = useState<unknown[]>([]);

  const onNewEventClick = (data) => {
    // const msg = `New event click action\n\n Callback data:\n\n${JSON.stringify({
    //   hour: data.hour,
    //   day: data.day,
    //   startAt: data.startAt,
    //   endAt: data.endAt,
    //   view: data.view,
    //   event: "click event ",
    // })}`;
  };

  // Callback for event click
  const onEventClick = (data) => {};

  // Callback after dragging is finished
  const onEventDragFinish = (prev, current, data) => {
    console.log("shit");
  };

  const getEventColor = (type: string) => {
    switch (type) {
      case "added":
        return "grey";
      case "aggregated":
        return "green";
      case "tracked":
        return "blue";
      case "calendar":
        return "red";
      default:
        return "yellow";
    }
  };

  useEffect(() => {
    const workEvents = workPeriods.map((wp) => {
      return {
        id: `${wp.endTime + wp.startTime}`,
        startAt: new Date(Number(wp.startTime) * 1000).toISOString(),
        endAt: new Date(Number(wp.endTime) * 1000).toISOString(),
        timezoneStartAt: "Europe/Berlin", // optional
        summary: wp.description,
        color: getEventColor(wp.type),
        calendarID: "work",
        ticker: wp.ticker,
      };
    });
    console.log(
      _.sortBy(workPeriods, (wp) => wp.startTime)
        .slice(1)
        .map((wp, i) => JSON.stringify(workPeriodToFinetrackerWorklog(i, wp)))
    );
    setEvents(workEvents);
  }, [workPeriods]);

  return (
    <div style={{ height: "1600px" }}>
      <Kalend
        kalendRef={kalendRef}
        onNewEventClick={onNewEventClick}
        initialView={CalendarView.WEEK}
        disabledViews={[]}
        onEventClick={onEventClick}
        events={events as unknown as CalendarEvent[]}
        initialDate={new Date().toISOString()}
        hourHeight={60}
        showWeekNumbers={true}
        timezone={"Europe/Berlin"}
        // draggingDisabledConditions={{
        //   summary: 'Computers',
        //   allDay: false,
        //   color: 'pink',
        // }}
        onEventDragFinish={onEventDragFinish}
        onStateChange={onStateChange}
        selectedView={selectedView}
        showTimeLine={true}
        isDark={false}
        autoScroll={true}
        disabledDragging={false}
        // colors={{
        //   light: {
        //     primaryColor: 'blue',
        //   },
        //   dark: {
        //     primaryColor: 'orange',
        //   },
        // }}
      />
    </div>
  );
};

export default Kalendar;
