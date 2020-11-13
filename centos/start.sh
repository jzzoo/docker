#!/bin/bash

function sruning(){
	if (ps aux|grep -v grep|grep BT)
	then
		echo "bt runing ...."
	else
		/etc/init.d/bt start
	fi

	if (ps aux|grep -v grep|grep sshd)
	then
		echo "sshd runing ...."
	else
		/usr/sbin/sshd -D
	fi
}

while true;
do
	echo 'Is checking ...';
	sruning
	sleep 10;
done