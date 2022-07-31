#!/bin/bash

DP21=$(xrandr | grep DP-2-1 | awk '{print $2}')
DP23=$(xrandr | grep DP-2-3 | awk '{print $2}')


if [ $DP21 == "connected" ]; then
	if [ $DP23 == "connected" ]; then
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off
		edp_1 ; xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1253x1440 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-2-1 --mode 2560x1440 --pos 1920x0 --rotate normal --output DP-2-2 --off --output DP-2-3 --mode 1440x900 --pos 480x540 --rotate normal
	fi
fi
