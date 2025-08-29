#!/bin/bash

lock="gtklock -d --style ~/.config/gtklock/style.css"
swayidle -w timeout 570 'notify-send "Inactive Notification" "If no activity is detected the system will suspend in 30 seconds."' \
            timeout 600 "systemctl suspend-then-hibernate" \
            after-resume "$lock" \
            lock "$lock"
# resume "$lock" \
            # timeout 300 "$lock"
