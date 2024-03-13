#!bin/bash


sudo docker rmi -f $(sudo docker images -q)

sudo docker rm -f mariadb-container