#!/bin/bash

if [ -d "/home/mbouyahy/data/mariadb" ]; then
	sudo rm -rf /home/mbouyahy/data/mariadb
fi

if [ -d "/home/mbouyahy/data/wordpress" ]; then
	sudo rm -rf /home/mbouyahy/data/wordpress
fi