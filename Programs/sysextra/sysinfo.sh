#!/bin/sh

while sleep 1; do
  D=`date +%a,%b,%d,%H,%M`
  A=`acpi | grep -o '.*%'`
  echo "loop'd"
  echo "$D" >> /root/sysinfo/date &
  echo "$A" >> /root/sysinfo/acpi &
done
