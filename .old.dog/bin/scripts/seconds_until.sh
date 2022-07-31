

next_event=`usch && grep -a1 "ﱢﱢﱢﱢﱢ" ~/.dot/sch.md | tail -n1`
next_event_timestamp=`echo $next_event | awk '{print $2" "$3" "$4" "$5" "$6}'`
next_event_task=`echo $next_event | grep -o "\[.*"`
current_timestamp=`date +%s`
event_timestamp=`date -d"$next_event_timestamp" +%s`
seconds_to_next_event=$((event_timestamp - current_timestamp))

days_left=`eval "echo $(date -ud "@$seconds_to_next_event" +'$((%s/3600/24))')"`
hours_left=`eval "echo $(date -ud "@$seconds_to_next_event" +'%H')"`

if [ $days_left -lt 1 ]; then
	if [ $hours_left -lt 1 ]; then
		eval "echo \"<span color='white' bgcolor='#cc241d'> 鬒 $(date -ud "@$seconds_to_next_event" +'$((%s/3600/24)) days %H:%M') $next_event_task </span>\""
	elif [ $hours_left -lt 3 ]; then
		eval "echo \"<span color='#191d20' bgcolor='#fb4934'> 鬒 $(date -ud "@$seconds_to_next_event" +'$((%s/3600/24)) days %H:%M') $next_event_task </span>\""
	elif [ $hours_left -lt 6 ]; then
		eval "echo \"<span color='#191d20' bgcolor='#ea6962'> 鬒 $(date -ud "@$seconds_to_next_event" +'$((%s/3600/24)) days %H:%M') $next_event_task </span>\""
	else
		eval "echo \"<span  color='#191d20' bgcolor='#d8a657'> 鬒 $(date -ud "@$seconds_to_next_event" +'$((%s/3600/24)) days %H:%M') $next_event_task </span>\""
	fi
else
	eval "echo \"<span color='#191d20' bgcolor='#A3BE8C'> 鬒 $(date -ud "@$seconds_to_next_event" +'$((%s/3600/24)) days %H:%M') $next_event_task </span>\""
fi
