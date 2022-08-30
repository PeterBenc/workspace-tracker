import React from "react";
import Kalend, { CalendarView } from "kalend";
import "kalend/dist/styles/index.css";
import WorkPeriods from "./work_periods.json";

const CalendComponent = (props) => {
  const events = WorkPeriods.map((wp) => {
    return {
      id: 1,
      startAt: new Date(Number(wp.startTime) * 1000).toISOString(),
      endAt: new Date(Number(wp.endTime) * 1000).toISOString(),
      timezoneStartAt: "Europe/Berlin", // optional
      summary: wp.ticker,
      color: "blue",
      calendarID: "work",
    };
  });
  const onNewEventClick = (data) => {
    const msg = `New event click action\n\n Callback data:\n\n${JSON.stringify({
      hour: data.hour,
      day: data.day,
      startAt: data.startAt,
      endAt: data.endAt,
      view: data.view,
      event: "click event ",
    })}`;
    console.log(msg);
  };

  // Callback for event click
  const onEventClick = (data) => {
    const msg = `Click on event action\n\n Callback data:\n\n${JSON.stringify(
      data
    )}`;
    console.log(WorkPeriods);
  };

  // Callback after dragging is finished
  const onEventDragFinish = (prev, current, data) => {
    console.log("shit");
  };

  return (
    <div style={{ height: "1600px" }}>
      <Kalend
        kalendRef={props.kalendRef}
        onNewEventClick={onNewEventClick}
        initialView={CalendarView.WEEK}
        disabledViews={[]}
        onEventClick={onEventClick}
        events={events}
        initialDate={new Date().toISOString()}
        hourHeight={80}
        showWeekNumbers={true}
        timezone={"Europe/Berlin"}
        // draggingDisabledConditions={{
        //   summary: 'Computers',
        //   allDay: false,
        //   color: 'pink',
        // }}
        onEventDragFinish={onEventDragFinish}
        onStateChange={props.onStateChange}
        selectedView={props.selectedView}
        showTimeLine={true}
        isDark={false}
        autoScroll={true}
        disabledDragging={true}
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

export default CalendComponent;
