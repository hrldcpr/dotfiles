
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
min_brightness=$((max_brightness / 100 + 1)) # 1%
step=$((max_brightness / 5)) # 20%

brightness=$(cat /sys/class/backlight/intel_backlight/brightness)

if [ "$1" = "down" ]; then
    brightness=$((brightness - step))
    if ((brightness < min_brightness)); then brightness=$min_brightness; fi
    echo "$brightness" > /sys/class/backlight/intel_backlight/brightness
elif [ "$1" = "up" ]; then
    brightness=$((brightness + step))
    if ((brightness > max_brightness)); then brightness=$max_brightness; fi
    echo "$brightness" > /sys/class/backlight/intel_backlight/brightness
fi

echo $((100 * brightness / max_brightness))
