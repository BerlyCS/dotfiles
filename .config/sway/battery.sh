#!/bin/bash
# battery_notify.sh
# This script checks the battery level every minute and sends a notification
# when the battery drops to 15%, 10%, or 5%.

# Requirements:
#  - The "acpi" command for checking battery status.
#  - The "notify-send" command for desktop notifications.

# Change these if your system uses a different battery command or battery file.
CHECK_INTERVAL=60  # seconds
STATEFILE="$(mktemp)"

# Function to extract the battery percentage.
get_battery_percentage() {
    # This command works if you have the acpi utility installed.
    # It should output a line like "Battery 0: Discharging, 14%, 01:35 remaining".
    acpi_output=$(acpi -b)
    # Extract the first number that ends with a '%' sign.
    percentage=$(echo "$acpi_output" | grep -oP '\d+(?=%)' | head -n1)
    echo "$percentage"
}

# Load the last notified threshold, default to 100 if the file doesn't exist.
if [[ -f "$STATEFILE" ]]; then
    last_threshold=$(cat "$STATEFILE")
else
    last_threshold=100
fi

# The thresholds at which to notify.
THRESHOLDS=(15 10 5)

while true; do
    battery=$(get_battery_percentage)
    # If acpi fails, battery may be empty – skip this iteration.
    if [[ -z "$battery" ]]; then
        sleep "$CHECK_INTERVAL"
        continue
    fi

    # Loop over each threshold. We check in descending order so that a drop
    # that passes more than one threshold at once (rare, but possible) only
    # triggers the highest relevant warning.
    for thresh in "${THRESHOLDS[@]}"; do
        # If current battery is at or below the threshold, and the last recorded
        # battery was above that threshold, send a notification.
        if (( battery <= thresh && last_threshold > thresh )); then
            notify-send "Battery Low ⚠️" "Battery at ${battery}% – please plug in your charger."
            # Update state so we do not notify again for the same threshold.
            echo "$thresh" > "$STATEFILE"
            break  # exit the for-loop once one notification is sent
        fi
    done

    # If the battery is recharging (or if you've plugged in the charger),
    # you might want to reset the state.
    # One way is to check if battery is increasing, or simply reset once above 15%.
    if (( battery > 15 )); then
        echo "100" > "$STATEFILE"
    else
        # Update state with current battery level (or keep the highest notified threshold).
        # This prevents multiple notifications for the same threshold.
        last_threshold=$(cat "$STATEFILE")
    fi

    sleep "$CHECK_INTERVAL"
done
