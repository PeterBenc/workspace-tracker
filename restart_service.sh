#!/bin/bash
sudo systemctl disable workspace_tracker
sudo systemctl stop workspace_tracker
echo "Service stoped"
rm -r dist
npx tsc
echo "Service rebuilding"
sudo systemctl daemon-reload
echo "Deamon reloaded"
sudo systemctl enable workspace_tracker
sudo systemctl start workspace_tracker
echo "DONE: Service restarted"