#!/bin/sh

cmd=$(printf "dark\nlock\nhalt\nwarm\nkill" | dmenu -h 18 -w 370 -y 1 -nb "#1A1A1A" -sb "#1A1A1A" -fn "DejaVu Sans Mono-8")

[[ -z "$cmd" ]] && exit 0

case "$cmd" in
    dark)
        xset dpms force off ;;
    lock)
        $HOME/.i3/i3lock.sh && sleep 1 ;;
    halt)
        $HOME/.i3/i3lock.sh && systemctl suspend ;;
    warm)
        systemctl reboot ;;
    kill)
        systemctl poweroff ;;
esac
