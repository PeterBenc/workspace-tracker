import React, { useEffect, useState } from "react";
import "kalend/dist/styles/index.css";
import { googleCalendar } from "./utils/googleCalendar";
import Kalendar from "./components/kalendar";

const App = (props) => {
  const [events, setEvents] = useState<unknown[]>([]);
  const [shouldTry, setShouldTry] = useState<boolean>(false);
  const [count, setCount] = useState(0);

  const handleAuth = async () => {
    googleCalendar.handleAuth();
    setShouldTry(true);
  };

  const getEvents = async () => {
    try {
      const events = await googleCalendar.listEvents();
      console.log(events);
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

  return (
    <div style={{ height: "1600px" }}>
      {events.length > 0 ? (
        <Kalendar events={events} />
      ) : (
        <button onClick={handleAuth}>Login</button>
      )}
    </div>
  );
};

export default App;
