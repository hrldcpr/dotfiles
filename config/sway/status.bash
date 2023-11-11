
while true; do
    # make volume and brightness buttons (in sway config) send some sort of event/signal to trigger immediate updates
    # (maybe convert this script to python or something for that)

    battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    battery_status=$(cat /sys/class/power_supply/BAT0/status | tr A-Z a-z)

    brightness=$(bash ~/.config/sway/brightness.bash)

    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

    date=$(date +'%m/%d %-I:%M%P')

    echo "$volume" volume - "$brightness"% brightness - "$battery_capacity"% "$battery_status" - "$date"

    # TODO update time at the _beginning_ of each minute
    sleep 10
done
