#!/bin/bash
RBUF='  '
LBUF='  '

chargeIndicator() {
  if [ $1 = '' ]; then
    echo 'o'
  else
    echo 'p'
  fi
}

while sleep 1
do
  BATTERY=`cat /root/sysinfo/acpi | grep -o -P '(?<=\s)[0-9]++(?=%)' | xargs printf '%3s%%'`
  CHARGING=`cat /root/sysinfo/acpi | grep 'Charging' | chargeIndicator`

  TIME=`cat /root/sysinfo/date | cut -c12-16`
  LEFT=''
  CENTER=''
  RIGHT="$BATTERY | $TIME"

  echo "%{l}$LBUF$LEFT%{c}$CENTER%{r}$RIGHT$RBUF"
done
