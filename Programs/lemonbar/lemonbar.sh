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

  DOW=`cat /root/sysinfo/date | head -1`
  MONTH=`cat /root/sysinfo/date | tail -4 | head -1`
  DOM=`cat /root/sysinfo/date | tail -3 | head -1`
  HOUR=`cat /root/sysinfo/date | tail -2 | head -1`
  MINUTE=`cat /root/sysinfo/date | tail -1`

  TIME="$DOW $MONTH $DOM | $HOUR:$MINUTE"
  LEFT=''
  CENTER=''
  RIGHT="$TIME | $BATTERY"

  echo "%{l}$LBUF$LEFT%{c}$CENTER%{r}$RIGHT$RBUF"
done
