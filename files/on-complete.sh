#!/bin/sh
if [ $2 -eq 1 ]; then
	rclone --config=/conf/rclone.conf copy /data/_dl gdrive:rclone
	mv "$3" /data/_waste
	rm -f /data/_waste/*
fi
echo [$(date)] $2, $3, $1 "<br>" >> /data/_log.html
