#!/bin/bash

function sruning(){
	echo "时间是：`date '+%Y-%m-%d %H:%M:%S'`" >> /tmp/sruning.log
}

while true;
do
	echo 'Is checking ...';
	sruning
	sleep 10;
done
