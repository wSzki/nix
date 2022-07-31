#!/bin/bash



# Message
var=$(cat)
#mess=`echo -e "$var" | tr ' ' _`
mess=$(php -r "echo urlencode(\"$var\");")

# votre log free mobile
#login=17184244
login=92786538
# votre key générée par free
key=2pvOsRrI0FLg16
# envoi du sms avec curl
curl "https://smsapi.free-mobile.fr/sendmsg?user="$login"&pass="$key"&msg="$mess""
