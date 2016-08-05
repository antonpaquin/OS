#!/bin/sh

while sleep 1
do
  D=`date +%a%n%b%n%d%n%H%n%M`
  A=`acpi`
  echo "$D" > /root/sysinfo/date
  echo "$A" > /root/sysinfo/acpi
done
