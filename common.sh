serverport=8080
myip=$(ip --oneline -f inet addr show dev wlan0 | cut -d' ' -f7 | cut -d/ -f1)

