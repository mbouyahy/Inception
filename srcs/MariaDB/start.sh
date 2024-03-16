#!bin/bash

sudo docker build -t mariadb-image .
sudo docker run -it --name mariadb-container mariadb-image /bin/bash