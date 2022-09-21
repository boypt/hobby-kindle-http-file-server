#!/bin/sh

source /mnt/us/extensions/filebrowser/common.sh


#check if fileserver is running
if pgrep fileserver >/dev/null 2>&1
then
  /usr/sbin/eips 11 33 "HTTP File Server is RUNNING"
  if [ -z "$myip" ];then
    /usr/sbin/eips 11 32 "No Wifi connection detected"
  else
    /usr/sbin/eips 11 32 "Visit: http://${myip}:${serverport}"
  fi
else
  /usr/sbin/eips 11 33 "HTTP File Server is NOT running"
fi

