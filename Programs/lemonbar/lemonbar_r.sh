#!/bin/bash
WIDTH="1920"
HEIGHT="40"

XOFFSET="0"
YOFFSET="0"

BGCOLOR="#444"
FGCOLOR="#CCC"

/root/lemonbar.sh | lemonbar -g"$WIDTH"x"$HEIGHT"+"$XOFFSET"+"$YOFFSET" -B $BGCOLOR -F $FGCOLOR
