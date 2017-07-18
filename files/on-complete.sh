#!/bin/sh
rclone --config=/conf/rclone.conf copy /data/_dl gdrive:rclone
        mv /data/_dl/* /data/_waste/
        rm -f /data/_waste/*
