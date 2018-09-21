#!/usr/bin/env bash

# Terminate already running bar instances
killall -q tint2
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x tint2 >/dev/null && pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# refresh wal theme
wal -R
# Launch tint2
tint2 &
# Launch polybar
polybar top &

echo "Bars launched..."


