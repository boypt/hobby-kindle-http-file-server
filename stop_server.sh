#!/bin/sh

source /mnt/us/extensions/filebrowser/common.sh
iptables -D INPUT -p tcp -m tcp --dport $serverport -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
if pkill fileserver; then
  /usr/sbin/eips 11 32 "HTTP Server stopped"
else
  /usr/sbin/eips 11 32 "HTTP Server may not started"
fi
