#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# Launch bar1 and bar2
MONITOR=$(polybar -m|tail -n1|sed -e 's/:.*$//g') polybar topbar &
sleep 1
MONITORS=$(polybar -m|sed -e 's/:.*$//g')
while read -r monitor; do
	MONITOR=$monitor polybar topbar-second &
	sleep 1
done <<< $MONITORS

echo "Bars launched..."
