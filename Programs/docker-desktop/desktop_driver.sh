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

/root/lemonbar.sh | lemonbar -g"$WIDTH"x"$HEIGHT"+"$XOFFSET"+"$YOFFSET" -B $BGCOLOR -F $FGCOLOR &

cat /root/common/nothing
