#!/bin/sh

 #If the notification daemon isn't running then launch it
#if ! pgrep -f "dunst" > /dev/null; then
	#dunst &
#fi

# Wait for the notification daemon to finish launching
while ! pgrep -f "dunst" > /dev/null; do

	# Set optional delay
	sleep 5

done

#notify-send $1
