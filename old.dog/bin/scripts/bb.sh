WAITFOR="Telegram"

APP=$(wmctrl -lp |grep "${WAITFOR}" |awk '{print $1}')
while [ -z "${APP}" ]; do
    sleep 1
    APP=$(wmctrl -lp |grep "${WAITFOR}" |awk '{print $1}')
done
xdotool windowunmap ${APP}
