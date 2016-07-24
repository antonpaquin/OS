#!/bin/sh

while sleep 1
do
  date > /sysinfo/date
  acpi > /sysinfo/acpi
done
