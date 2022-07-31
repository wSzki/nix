#!/bin/sh

export XAUTHORITY=/home/wsz/.Xauthority
export DYSPLAY=":0"

acpi -b | grep "Battery 0" | awk -F'[,:%]' '{print $2, $3}' | {
  read -r status capacity


  if [ "$status" = Discharging -a "$capacity" -lt 80 ]; then
    /bin/i3parrotwarning
      systemctl suspend && slock
  fi

  if [ "$status" = Unknown -a "$capacity" -lt 4 ]; then
    systemctl suspend && slock
  fi
}
