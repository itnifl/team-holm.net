#!/bin/bash

HOUR=`date +%H`
DATE=`date`
HIT=0

if [ $HOUR -eq 22 ]; then
	/etc/init.d/rtorrent start 2>> /var/log/startStopTorrent.log >> /var/log/startStopTorrent.log
	if [ $? -gt 0 ]; then
		echo "${DATE} - Running script at hour: ${HOUR}" >> "/var/log/startStopTorrent.log"
		echo "${DATE} - Failed starting rTorrent" >> "/var/log/startStopTorrent.log"
	else
		echo "${DATE} - Running script at hour: ${HOUR}" >> "/var/log/startStopTorrent.log"
		echo "${DATE} - rTorrent started successfully" >> "/var/log/startStopTorrent.log"
	fi
	HIT=1
fi
if [ $HOUR -eq 7 ]; then
	/etc/init.d/rtorrent stop  2>> /var/log/startStopTorrent.log >> /var/log/startStopTorrent.log
	if [ $? -gt 0 ]; then
		echo "${DATE} - Running script at hour: ${HOUR}" >> "/var/log/startStopTorrent.log"
		echo "${DATE} - Failed stopping rTorrent" >> "/var/log/startStopTorrent.log"
	else
		echo "${DATE} - Running script at hour: ${HOUR}" >> "/var/log/startStopTorrent.log"
		echo "${DATE} - rTorrent stopped successfully" >> "/var/log/startStopTorrent.log"
	fi
	HIT=2
fi
#if [ HIT ]; then
	#Commented out this line, since it was just filling the log
	#echo "${DATE} - rTorrent was run, but had nothing to do" >> /var/log/startStopTorrent.log
#fi

if [ `stat -c %s /var/log/startStopTorrent.log` -gt 500000 ]; then
	mv /var/log/startStopTorrent.log /var/log/startStopTorrent.log.1
fi