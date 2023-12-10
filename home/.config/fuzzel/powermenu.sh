#!/bin/sh
 
lock=" Lock"
exit="󰗼 Exit"
shutdown="󰐥 Poweroff"
reboot=" Reboot"
sleep=" Suspend"
 
selected_option=$(echo "$lock
$exit
$sleep
$reboot
$shutdown" | fuzzel -d --lines 5 --width 14 )

case $selected_option in
  "$lock")
    gtklock -d
    ;;
  "$exit")
    swaymsg exit
    ;;
  "$shutdown")
    loginctl poweroff
    ;;
  "$reboot")
    loginctl reboot
    ;;
  "$sleep")
    loginctl suspend
    ;;
  *)
    echo "No match"
    ;;
esac
