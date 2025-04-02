#!/bin/bash

FULL_PERCENTAGE=(90 99 100)
LOW_PERCENTAGE=(10 15 20)

# used to avoid repetitive notifications
FULL_BATTERY_NOTIFIED=0
LOW_BATTERY_NOTIFIED=100

while true; do
  STATUS=$(cat /sys/class/power_supply/BAT1/status)
  CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)

  if [ "$STATUS" == "Discharging" ]; then
    #Suspend if not charging in critical percentage
    if [ "$FULL_BATTERY_NOTIFIED" -gt 0 ]; then
      FULL_BATTERY_NOTIFIED=0
    fi
    if [ "$CAPACITY" -le 5 ]; then
      notify-send "Battery Critical" "$CAPACITY% remaining! Suspending in 60 seconds..." -u critical
      sleep 59
      STATUS_NEW=$(cat /sys/class/power_supply/BAT1/status)
      CAPACITY_NEW=$(cat /sys/class/power_supply/BAT1/capacity)
      if [ "$STATUS_NEW" == "Discharging" ] && [ "$CAPACITY_NEW" -le 5 ]; then
        notify-send "Suspending Now" "Battery critically low. System suspending..." -u critical
        sleep 1
        systemctl suspend
      fi
    else
      for LEVEL in "${LOW_PERCENTAGE[@]}"; do
        if [ "$CAPACITY" -le "$LEVEL" ] && [ "$LOW_BATTERY_NOTIFIED" -gt "$LEVEL" ]; then
          notify-send "Battery low." "$CAPACITY% remaining. Plug in the charger."
          LOW_BATTERY_NOTIFIED="$LEVEL"
        fi
      done
    fi
  elif [ "$STATUS" == "Charging" ]; then
      # Battery is charging, check for high levels
      if [ "$LOW_BATTERY_NOTIFIED" -lt 100 ]; then
        LOW_BATTERY_NOTIFIED=100
      fi
      for LEVEL in "${FULL_PERCENTAGE[@]}"; do
          if [ "$CAPACITY" -ge "$LEVEL" ] && [ "$FULL_BATTERY_NOTIFIED" -lt "$LEVEL" ]; then
              if [ "$LEVEL" -ge 90 ]; then
                  notify-send "Battery Almost Full" "$LEVEL% charged. Consider unplugging soon." -u normal
              else
                  notify-send "Battery Full" "$LEVEL% charged. Unplug to prolong battery life." -u critical
              fi
              FULL_BATTERY_NOTIFIED=$LEVEL
              break
          fi
      done
  fi

  # Wait 30 seconds before checking again
  sleep 30
done
