#!/bin/sh

source /mnt/us/extensions/filebrowser/common.sh
(/mnt/us/extensions/filebrowser/fileserver --noauth -a 0.0.0.0 -p $serverport -r "/mnt/us" 1> /dev/null 2> /dev/null)&
