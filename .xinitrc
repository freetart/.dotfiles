#!/bin/sh

# run background programs
slstatus &
xbanish &

# system tray applets
nm-applet &
pasystray &

# lock screen
xautolock -time 30 -locker slock &

# power & brightness commands
tlp start
xset s off
xset dpms 0 0 0
xset -dpms s off

# disable thinkpad touchpad
xinput set-prop 10 "Device Enabled" 0

# set main display
xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2 --off

# exec window manager
exec dbus-launch --sh-syntax --exit-with-session dwm
