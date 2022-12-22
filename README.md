##

- [ ] when the mouse is not moving, (lets say for an hour), and its a work workspace, it might that I forgot to
      shut the pc down, in that case, stop logging and remove logs from last hour
- [ ] make really sure the logging start after reboot (make the wait longer)
- [ ] bug by rafo, write to file more often (otherwise you might miss basically 5 minute every time you close the lid)
- [ ] fix overlapping work periods
- [ ] backup the log file every half an hour or something, make it into the system ctl service, find an online versioning tool that would handle it (github maybe)

- [ ] fix service failing after boot
- [ ] make calendar the central piece of the app
- [ ] a new workspace called W for work stuff that yu cant really assign to a specific task

- [x] ts react
- [x] serverful app with webpack (or better solution)
- [ ] have a page for stats
- [x] log to calendar
- [ ] log to jira, submit logs all from GUI
- [ ] possibly make into electron app

- [x] fix daily summary
- [x] merge work time periods separated by n minutes (I guess 5 makes sense)
- [ ] periodically backup the logs, have a second file which is used for stats and logging, another one just used for writing
- [ ] create and merge artificial log periods, check for conflicts, (this will be used for google events too)
- [ ] integrate google calendar events
- [ ] work periods => tempo format
- [ ] first commit and then submit tempo time sheets on command
- [ ] get previous day logs, sync with jira to have the task description
- [ ] everyday before standup, generate report from previous day (days if without description) and add description to events
- [ ] move windows to horizontal workspaces when reducing the number of monitors
- [ ] calculate daily effectivity (total hours behind PC/total worked)
