#!/bin/bash
RBUF='  '
LBUF='  '
BSPWM_BUF=' '
BSPWM_COLOR='#181818'
sysinfo='/root/sysinfo'

m_BATTERY() {
  BAT=$(cat $sysinfo/acpi)
  BPERC=$(echo $BAT | grep -o -P '(?<=\s)[0-9]++(?=%)' | xargs printf '%3s%%')
  BCHARGE=$(echo $BAT | grep 'Charging')
  BATTERY="$BPERC"
}

m_TIME() {
  DATE=$(cat $sysinfo/date)
  DOW=$(echo "$DATE" | head -1)
  MONTH=$(echo "$DATE" | tail -4 | head -1)
  DOM=$(echo "$DATE" | tail -3 | head -1)
  HOUR=$(echo "$DATE" | tail -2 | head -1)
  MINUTE=$(echo "$DATE" | tail -1)
  TIME="$DOW $MONTH $DOM | $HOUR:$MINUTE"
}

m_BSPWM() {
  DAT=$(cat $sysinfo/bspwm_windows)
  W1="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 1p)"%{B-}"$BSPWM_BUF
  W2="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 2p)"%{B-}"$BSPWM_BUF
  W3="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 3p)"%{B-}"$BSPWM_BUF
  W4="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 4p)"%{B-}"$BSPWM_BUF
  W5="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 5p)"%{B-}"$BSPWM_BUF
  W6="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 6p)"%{B-}"$BSPWM_BUF
  W7="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 7p)"%{B-}"$BSPWM_BUF
  W8="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 8p)"%{B-}"$BSPWM_BUF
  W9="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 9p)"%{B-}"$BSPWM_BUF
  W10="%{B$BSPWM_COLOR}"$(echo "$DAT" | sed -n 10p)"%{B-}"

  BSPWM=$W1$W2$W3$W4$W5$W6$W7$W8$W9$W10
}

form() {
  LEFT=''
  CENTER="$BSPWM"
  RIGHT="$TIME | $BATTERY"

  LBAR="%{l}$LBUF$LEFT%{c}$CENTER%{r}$RIGHT$RBUF"
}


while sleep 1
do
  m_BATTERY
  m_TIME
  m_BSPWM

  form

  echo $LBAR
done
