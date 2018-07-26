#!/bin/bash

#  /usr/local/nginx/sbin/nginx
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
}

while true; 
do 
	echo 'Is checking ...'; 
	runing
	sleep 1; 
done

