#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do
    sleep 2
done

primary_monitor=$(polybar -m | grep '(primary)' |
    sed -e 's/:.*$//g')
all_monitors=$(polybar -m |
    sed -e 's/:.*$//g')

WM=${1:+"-$1"}

# Launch bar1 and bar2
MONITOR=${primary_monitor} polybar "topbar${WM}" &
sleep 1
while read -r monitor; do
    echo "launching bar on $monitor"
	MONITOR=$monitor polybar "topbar2${WM}" &
	sleep 1
done <<< "$all_monitors"

echo "Bars launched..."
