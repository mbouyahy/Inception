#!/bin/bash

# mysql_install_db --defaults-file=~/.my.cnf

# mysql start

# mysqld --user=mysql --bootstrap
# mysql status



if [ ! -d "/var/run/mysqld" ]; then 
	mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld
fi

systemctl start mysqld

if [ ! -d "/var/lib/mysql/${WORDPRESS_DATABASE_NAME}" ]; then

        cat << EOF > /tmp/db.sql
	USE mysql;
	FLUSH PRIVILEGES;
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASSWD}';
	CREATE DATABASE ${WORDPRESS_DATABASE_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
	CREATE USER '${DATABASE_USER}'@'%' IDENTIFIED by '${DATABASE_PASSWD}';
	GRANT ALL PRIVILEGES ON ${WORDPRESS_DATABASE_NAME}.* TO '${DATABASE_USER}'@'%';
	FLUSH PRIVILEGES;
EOF
        mysqld --user=mysql --bootstrap < /tmp/db.sql
        # mariadbd --user=mysql --bootstrap < /tmp/db.sql
        rm -f /tmp/db.sql
else
        echo "Database already exists"
fi

exec "$@"