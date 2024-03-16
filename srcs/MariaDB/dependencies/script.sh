#!/bin/bash

# mysql_install_db --defaults-file=~/.my.cnf

# mysql start

# mysqld --user=mysql --bootstrap
# mysql status



# if [ ! -d "/var/run/mysqld" ]; then 
# 	mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld
# 	chown -R mysql:mysql /var/lib/mysql/
# 	chmod -R 755 /var/lib/mysql/
# 	chmod -R 755 /etc/mysql/conf.d
# 	chmod -R 644 /var/lib/mysql/*

# 	chown -R mysql:mysql /var/lib/mysql/mysql/
# 	chmod -R 755 /var/lib/mysql/mysql/
# 	chmod -R 644 /var/lib/mysql/mysql/*
# fi

# if [ ! -d "/var/lib/mysql" ]; then
# 	mkdir -p /var/lib/mysql
# 	chown -R mysql:mysql /var/lib/mysql/
# 	chmod -R 755 /var/lib/mysql/
# 	chmod -R 644 /var/lib/mysql/*

# 	chown -R mysql:mysql /var/lib/mysql/mysql/
# 	chmod -R 755 /var/lib/mysql/mysql/
# 	chmod -R 644 /var/lib/mysql/mysql/*
# fi

# /usr/local/mysql/support-files/mysql.server stop

# if [ ! -d "/var/run/mysqld" ]; then
# 	mariadb_install_db --user=mysql --datadir=/var/lib/mysql
	# bin/mysql_install_db --user=mysql \
    # --basedir=/var/mysql/mysql \
    # --datadir=/var/mysql/mysql/data
# fi
	# /usr/bin/mariadb-install-db --defaults-file=~/.my.cnf
# echo ${WORDPRESS_DATABASE_NAME}
# mysqld_safe --skip-grant-tables&
if [ ! -d "/var/lib/mysql/${WORDPRESS_DATABASE_NAME}" ]; then
	echo "ENTER"
        cat << EOF > /tmp/temp.sql
	USE mysql;
	FLUSH PRIVILEGES;
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1', '172.19.0.1');
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASSWD}';
	CREATE DATABASE ${WORDPRESS_DATABASE_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
	CREATE USER '${DATABASE_USER}'@'%' IDENTIFIED by '${DATABASE_PASSWD}';
	GRANT ALL PRIVILEGES ON ${WORDPRESS_DATABASE_NAME}.* TO '${DATABASE_USER}'@'%';
	FLUSH PRIVILEGES;
EOF
        # mysqld --user=mysql --bootstrap < /tmp/temp.sql
        mysqld --user=mysql --bootstrap < /tmp/temp.sql
		# cd /var/run/mysqld
		# ls -la
        rm -f /tmp/temp.sql
else
        echo "exist"
fi

exec "$@"