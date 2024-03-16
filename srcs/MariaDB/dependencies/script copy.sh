# #!/bin/bash

# # Define database credentials
# # MYSQL_USER="root"
# # MYSQL_PASSWORD="root_password"
# # NEW_PASSWORD="new_password"
# # MYSQL_ROOT_PASSWORD=root_password 




# # MYSQL_USER="root"
# # MYSQL_USER_PASSWORD="root_password"
# # MYSQL_DATABASE="db"
# # MYSQL_ROOT_PASSWORD="root_password"


# #!/bin/bash

# # Define container name
# # CONTAINER_NAME="mariadb-container"

# # Define database credentials
# # MYSQL_USER="root"
# # MYSQL_USER_PASSWORD="root_password"

# # # Run a command inside the MariaDB container
# # docker exec -it "$CONTAINER_NAME" mysql -u "$MYSQL_USER" -p"$MYSQL_USER_PASSWORD" << EOF
# # # SQL commands go here
# # EOF

# # Execute SQL commands using mysql command-line tool

# # mysql -u"$MYSQL_USER" -p"$MYSQL_ROOT_PASSWORD" << EOF
# # # CREATE DATABASE wordpress;
# # EOF
# # mariadb -e "CREATE DATABASE wordpress";
# # mariadb -e "CREATE USER 'wordpressuser'@'%' IDENTIFIED BY 'password'";
# # mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'%'";
# # mariadb -e "FLUSH PRIVILEGES";
# # mysqld_safe

# # tail -f /bin/ls > /dev/null

# # #!/bin/bash

# # # Wait for MariaDB to start
# # while ! mysqladmin ping -hlocalhost --silent; do
# #     sleep 1
# # done

# # # Define database credentials
# # MYSQL_USER="root"
# # MYSQL_PASSWORD="root_password"
# # NEW_PASSWORD="new_password"
# # # # Execute SQL commands using mysql command-line tool
# # mariadb -u root -p${DB_ROOT_PASSWD}
# # # << EOF
# # mariadb -e "CREATE DATABASE IF NOT EXISTS testdb";
# # mariadb -e "CREATE USER IF NOT EXISTS 'testuser'@'%' IDENTIFIED BY 'test_password'";
# # mariadb -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'%'";
# # mariadb -e "FLUSH PRIVILEGES";
# # EOF

# # exec "$@"
# #!bin/sh

# # WP_DB_USER="wordpress"
# # WP_DB_PASSWORD="wordpress"
# # WP_DB_NAME="wordpress"

# # DB_USER="wordpress"
# # DB_USER_PASSWORD="wordpress"
# # DB_DATABASE="wordpress"
# # DB_ROOT_PASSWORD="wordpress"

# # if [ ! -d "/var/lib/mysql/${WP_DB_NAME}" ]; then

# #         cat << EOF > /tmp/db.sql
# # 	USE mysql;
# # 	FLUSH PRIVILEGES;
# # 	DELETE FROM mysql.user WHERE User='';
# # 	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# # 	ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWD}';
# # 	CREATE DATABASE ${WP_DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
# # 	CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASSWD}';
# # 	GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${DB_USER}'@'%';
# # 	FLUSH PRIVILEGES;
# # EOF
# # #         mariadbd --user=mysql --bootstrap < /tmp/db.sql
# # #         rm -f /tmp/db.sql
# # # else
# # #         echo "Database already exists"
# # fi

# # exec "$@"



# # WP_DB_NAME="wordpress"

# # if [ ! -d "/var/lib/mysql/${WP_DB_NAME}" ]; then
# #     mariadb -u root -p${DB_ROOT_PASSWORD} -e "
# #     USE mysql;
# #     FLUSH PRIVILEGES;
# #     DELETE FROM mysql.user WHERE User='';
# #     DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# #     # ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
# #     # CREATE DATABASE ${WP_DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
# #     # CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_USER_PASSWORD}';
# #     # GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${DB_USER}'@'%';
# #     # FLUSH PRIVILEGES;"
# # else
# #     echo "Database already exists"
# # fi

# # exec "$@"


# # sudo docker run -d -p "3306:3306"  --name mariadb-container mariadb-image
# # mysql -u "root" -p"root_password"

# #!/bin/bash

# # Start the server
# # mysqld &

# # Wait for the server to start up
# # sleep 30

# # Run your command
# # mysql -u "root" -p"$MYSQL_ROOT_PASSWORD" -e "DELETE FROM mysql.user WHERE User='';"

# # Keep the container running
# # tail -f /dev/null



# # script.sh

# #!/bin/sh

# mysql_install_db

# /etc/init.d/mysql start

# #Check if the database exists

# if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
# then 

# 	echo "Database already exists"
# else

# # Set root option so that connexion without root password is not possible

# mysql_secure_installation << _EOF_

# Y
# root4life
# root4life
# Y
# n
# Y
# Y
# _EOF_


# # MYSQL_ROOT_PASSWORD="root_password"

# #Add a root user on 127.0.0.1 to allow remote connexion 
# #Flush privileges allow to your sql tables to be updated automatically when you modify it
# #mysql -uroot launch mysql command line client
# # echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

# # #Create database and user in the database for wordpress

# # echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

# # echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot -p

# # echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot -p

# # #Import database in the mysql command line
# # mysql mysql -uroot -p $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

# fi
# /etc/init.d/mysql stop

# exec "$@"


#!/bin/bash



# /etc/init.d/mysql stop


mysql_install_db

# /usr/bin/mysql_install_db --defaults-file=~/.my.cnf

# /usr/sbin/mysqld --skip-grant-tables --general-log &

# mysql -u root

# use mysql;
# update user set password=PASSWORD("root") where User='root';
# flush privileges;
# quit;
# /etc/init.d/mysql start
# mysqladmin -u root
# /usr/sbin/mysqld --skip-grant-tables --general-log &
# /usr/sbin/mysqld --bind-address=0.0.0.0

# mysqld_safe --bind-address=0.0.0.0 --skip-grant-tables &

# mysql_install_db --user=mysql --skip-name-resolve --force
# mysqld --bind-address=0.0.0.0

# /usr/bin/mysql -u mysql
# mysql> show tables;

# mysql -u root
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';" | mysql -u root
# if [ ! -d "/var/lib/mysql/${WP_DB_NAME}" ]; then

#         cat << EOF > /tmp/db.sql
# 	USE mysql;
# 	FLUSH PRIVILEGES;
# 	DELETE FROM mysql.user WHERE User='';
# 	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# 	ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWD}';
# 	CREATE DATABASE ${WP_DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
# 	CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASSWD}';
# 	GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${DB_USER}'@'%';
# 	FLUSH PRIVILEGES;
# EOF
#         mariadbd --user=mysql --bootstrap < /tmp/db.sql
#         rm -f /tmp/db.sql
# else
#         echo "Database already exists"
# fi
# mysqld_safe --bind-address=0.0.0.0 --skip-grant-tables &
# CMD ["mariadb", "--bind-address=0.0.0.0"]
# mariadb --user=root
exec "$@"
# exec mariadb --user=root