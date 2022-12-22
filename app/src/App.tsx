import React, { useEffect, useMemo, useState } from "react";
import "kalend/dist/styles/index.css";
import { googleCalendar } from "./utils/googleCalendar";
import Kalendar from "./components/kalendar";
import { WorkPeriod } from "./utils/logParser/types";
import { parseLogs } from "./utils/logParser";

const App = (props) => {
  const [events, setEvents] = useState<WorkPeriod[]>([]);
  const [workPeriods, setWorkPeriods] = useState<WorkPeriod[]>([]);

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

  const getWorkPeriods = async () => {
    try {
      const workPeriods = await parseLogs();
      setWorkPeriods(workPeriods);
    } catch (e) {}
  };

  useEffect(() => {
    if (workPeriods.length === 0) {
      // TODO: check here if its | null,
      getWorkPeriods();
    }
    const timer = setTimeout(() => {
      if (shouldTry) {
        getEvents();
        setCount(count + 1);
      }
    }, 1000);
    return () => clearTimeout(timer);
  }, [shouldTry, count, workPeriods]);

  return (
    <div style={{ height: "1600px" }}>
      {true ? ( // TODO:
        <Kalendar workPeriods={[...workPeriods, ...events]} />
      ) : (
        <button onClick={handleAuth}>Login</button>
      )}
    </div>
  );
};

export default App;
