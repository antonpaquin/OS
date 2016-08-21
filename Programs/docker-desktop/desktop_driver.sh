#!/bin/bash

WIDTH="1920"
HEIGHT="40"

XOFFSET="0"
YOFFSET="0"

BGCOLOR="#444"
FGCOLOR="#CCC"

feh --bg-scale /root/wallhaven-blue+white.jpg &

export SHELL=/bin/sh &&
sxhkd -c /root/sxhkdrc &

cat /root/sysinfo/nothing > /root/sysinfo/bspwm_desktops &
cat /root/sysinfo/nothing > /root/sysinfo/bspwm_windows &
cat /root/sysinfo/nothing > /root/sysinfo/acpi &
cat /root/sysinfo/nothing > /root/sysinfo/date &

python3 /root/lemonbar.py | lemonbar -g"$WIDTH"x"$HEIGHT"+"$XOFFSET"+"$YOFFSET" -B $BGCOLOR -F $FGCOLOR &

cat /root/common/nothing
