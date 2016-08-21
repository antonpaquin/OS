#!/bin/sh

DOLD''
AOLD=''

while sleep 1
do
  D=`date +%a,%b,%d,%H,%M`
  A=`acpi | grep -o '.*%'`
  if [ "$DOLD" != "$D" ]; then
    echo "$D" > /root/sysinfo/date
    DOLD="$D"
  fi
  if [ "$AOLD" != "$A" ]; then
    echo "$A" > /root/sysinfo/acpi
    AOLD="$A"
  fi
done
