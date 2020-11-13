#!/bin/bash

# You can do some event initialization
function runing(){
    # todo
    echo "runing..."
}

# Dead loop execution
while true
do
	echo 'Is checking ...';
	runing
	sleep 1;
done

