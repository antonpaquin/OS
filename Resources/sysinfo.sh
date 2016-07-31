#!/bin/sh

while sleep 1
do
  D=`date`
  A=`acpi`
  echo $D > /root/sysinfo/date
  echo $A > /root/sysinfo/acpi
done
