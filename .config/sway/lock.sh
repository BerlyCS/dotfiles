#!/bin/bash

lock="gtklock --style ~/.config/gtklock/style.css"
swayidle -w timeout 270 'notify-send "Inactivity detected" "locking in 30 seconds if no activity"' \
            timeout 300 "$lock" \
            timeout 600 "systemctl suspend-then-hibernate"
