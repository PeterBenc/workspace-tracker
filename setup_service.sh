#!/bin/bash
sudo cp workspace_tracker.service /lib/systemd/system/workspace_tracker.service
sudo systemctl daemon-reload
sudo systemctl workspace_tracker