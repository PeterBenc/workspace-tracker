#!/bin/bash
sudo systemctl stop workspace_tracker
echo "Service stoped"
rm -r dist
npx tsc
echo "Service rebuilding"
sudo systemctl daemon-reload
echo "Deamon reloaded"
sudo sudo systemctl start workspace_tracker
sudo systemctl enable workspace_tracker
echo "DONE: Service restarted"