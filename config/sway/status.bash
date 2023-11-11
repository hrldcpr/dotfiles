
while true; do
    # make volume and brightness buttons (in sway config) send some sort of event/signal to trigger immediate updates
    # (maybe convert this script to python or something for that)

    battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    battery_status=$(cat /sys/class/power_supply/BAT0/status)

    brightness=$(bash ~/.config/sway/brightness.bash)

    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

    date=$(date +'%Y-%m-%d %I:%M %p')

    echo Volume: "$volume" Brightness: "$brightness"% Battery: "$battery_capacity"% "$battery_status" "$date"

    sleep 60
done
