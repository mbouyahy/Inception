#!/bin/bash

COLOR_GREEN='\033[0;32m'  # Escape code for Red color
COLOR_RESET='\033[0m'   # Escape code to reset color

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
        cat << EOF > /tmp/queries.sql
	FLUSH PRIVILEGES;
    DELETE FROM mysql.user WHERE User='';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    CREATE DATABASE ${MYSQL_DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci;

    CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

    ALTER TABLE mysql.event MODIFY COLUMN definer VARCHAR(141);
    FLUSH PRIVILEGES;
EOF
        mariadbd --user=root --bootstrap < /tmp/queries.sql
        rm -f /tmp/queries.sql
else
    echo "${COLOR_GREEN} Database Exist ${COLOR_RESET}"
fi

exec mariadbd --bind-address=0.0.0.0
