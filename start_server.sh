#!/bin/sh

# kill the server if it is running
pkill filebrowser

source /mnt/us/extensions/filebrowser/common.sh

# start the server
/usr/sbin/eips 11 32 "Starting..."
iptables -A INPUT -p tcp -m tcp --dport $serverport -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sleep 1

chmod a+x /mnt/us/extensions/filebrowser/fileserver
chmod a+x /mnt/us/extensions/filebrowser/server.sh
/mnt/us/extensions/filebrowser/server.sh

#check if fileserver is running
if pgrep fileserver >/dev/null 2>&1; then
  /usr/sbin/eips 11 32 "HTTP Server started"
  if [ -z $myip ]; then
    /usr/sbin/eips 11 33 "No Wifi connection detected"
  else
    /usr/sbin/eips 11 33 "Visit: http://${myip}:${serverport}"
  fi
else
  /usr/sbin/eips 11 32 "HTTP Server failed to start"
fi
