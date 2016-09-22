#!/bin/bash

WIDTH="1920"
HEIGHT="40"

XOFFSET="0"
YOFFSET="0"

BGCOLOR="#33393d"
FGCOLOR="#E4F1FA"

export SHELL=/bin/sh &&

python3 -u /root/lemonbar.py | lemonbar -g"$WIDTH"x"$HEIGHT"+"$XOFFSET"+"$YOFFSET" -B $BGCOLOR -F $FGCOLOR -f "DejaVu Sans-18" -f "FontAwesome-10" &

cat /root/common/nothing
