#!/bin/sh

cat /root/sysinfo/nothing > /root/sysinfo/bspwm_desktops &
cat /root/sysinfo/nothing > /root/sysinfo/bspwm_windows &
cat /root/sysinfo/nothing > /root/sysinfo/acpi &
cat /root/sysinfo/nothing > /root/sysinfo/date &

while sleep 1; do
  D=`date +%a,%b,%d,%H,%M`
  A=`acpi | grep -o '.*%'`
  echo "loop'd"
  echo "$D" >> /root/sysinfo/date & echo "$A" >> /root/sysinfo/acpi
done
