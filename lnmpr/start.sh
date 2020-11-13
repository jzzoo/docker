#!/bin/bash

function runing(){
	if (ps aux|grep -v grep|grep php56)
	then
		echo "php56-fpm runing ...."
	else
		/usr/local/php56/sbin/php-fpm
	fi
	
	if (ps aux|grep -v grep|grep php72)
	then
		echo "php72-fpm runing ...."
	else
		/usr/local/php72/sbin/php-fpm 
	fi
	
	if (ps aux|grep -v grep|grep nginx)
	then
		echo "nginx runing ...."
	else
		/usr/local/nginx/sbin/nginx
	fi
	
	if (ps aux|grep -v grep|grep mysql)
	then
		echo "mysql runing ...."
	else
		 /etc/init.d/mysqld start
	fi
	
	if (ps aux|grep -v grep|grep redis)
	then
		echo "redis runing ...."
	else
		redis-server
	fi
}

while true; 
do 
	echo 'Is checking ...'; 
	runing
	sleep 1; 
done

