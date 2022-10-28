import React, { useEffect, useMemo, useState } from "react";
import "kalend/dist/styles/index.css";
import { googleCalendar } from "./utils/googleCalendar";
import Kalendar from "./components/kalendar";
import { WorkPeriod } from "./utils/logParser/types";
import { parseWorkPeriods } from "./utils/logParser";

const App = (props) => {
  const [events, setEvents] = useState<WorkPeriod[]>([]);
  const [shouldTry, setShouldTry] = useState<boolean>(false);
  const [count, setCount] = useState(0);

  const handleAuth = async () => {
    googleCalendar.handleAuth();
    setShouldTry(true);
  };

  const getEvents = async () => {
    try {
      const events = await googleCalendar.listEvents();
      setEvents(events);
      setShouldTry(false);
    } catch (e) {}
  };

  useEffect(() => {
    const timer = setTimeout(() => {
      if (shouldTry) {
        getEvents();
        setCount(count + 1);
      }
    }, 1000);
    return () => clearTimeout(timer);
  }, [shouldTry, count]);

  const workPeriods = useMemo(() => parseWorkPeriods(), []);

  return (
    <div style={{ height: "1600px" }}>
      {events.length > 0 ? (
        <Kalendar workPeriods={[...workPeriods, ...events]} />
      ) : (
        <button onClick={handleAuth}>Login</button>
      )}
    </div>
  );
};

export default App;
