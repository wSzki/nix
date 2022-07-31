firefox "about:blank" &
WAITFOR="Mozilla Firefox"

APP=$(wmctrl -lp |grep "${WAITFOR}" |awk '{print $1}')
while [ -z "${APP}" ]; do
    sleep 5
    APP=$(wmctrl -lp |grep "${WAITFOR}" |awk '{print $1}')
done
xdotool windowunmap ${APP}
