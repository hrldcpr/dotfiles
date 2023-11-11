
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

brightness=$(bash ~/.config/sway/brightness.sh)

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

date=$(date +'%Y-%m-%d %I:%M:%S %p')

echo Volume: "$volume" Brightness: "$brightness"% Battery: "$battery_capacity"% "$battery_status" "$date"
