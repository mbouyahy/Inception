#!bin/bash

sudo docker build -t mariadb-image .
sudo docker run -it --name mariadb-container mariadb-image /bin/bash


#WORKING 
# sudo docker build -t mariadb-image .
# sudo docker run -d -p "3306:3306"  --name mariadb-container mariadb-image
# sudo docker exec -it mariadb-container /bin/bash


#LOGGING
# mysql -uroot -p1234