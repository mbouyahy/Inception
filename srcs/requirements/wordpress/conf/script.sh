#!/bin/bash

COLOR_GREEN='\033[0;32m'  # Red color
COLOR_RESET='\033[0m'   # Reset color

if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
	echo "${COLOR_GREEN}WordPress is already exist ${COLOR_RESET}"
fi

if [ ! -x "/usr/local/bin/wp" ]; then
    cd /tmp
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
	echo "${COLOR_GREEN}WC-CLI downlaoded ${COLOR_RESET}"
else
	echo "${COLOR_GREEN}WC-CLI already exist ${COLOR_RESET}"
fi

if [ ! -d "/var/www/html/wordpress" ]; then
    mkdir -p /var/www/html/wordpress
	echo "${COLOR_GREEN}/var/www/html/wordpress Created ${COLOR_RESET}"
fi

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
	echo "${COLOR_GREEN}Downloading Wordpress.... ${COLOR_RESET}"

	#Get the necessary permissions to /var/www/html/wordpress
	chmod -R 755 /var/www/html/wordpress
	chown -R www-data:www-data /var/www/html/wordpress
	cd /var/www/html/wordpress
	rm -rf /var/www/html/wordpress/*

	wp core download --allow-root

	# create wp-config.php
	wp config create --allow-root --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST}

	# Install WordPress
	wp core install --allow-root --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL}

	# check the user i need to create if exist or not
	if wp user list --allow-root | grep -q "\<${WORDPRESS_USER}\>"; then
		echo "${COLOR_GREEN}User ${WORDPRESS_USER} already exists ${COLOR_RESET}"
	else
		# Create the user if it doesn't exist
		wp user create "${WORDPRESS_USER}" "${WORDPRESS_USER_EMAIL}" --role=editor --user_pass="${WORDPRESS_USER_PASSWORD}" --allow-root
	fi
fi

echo "${COLOR_GREEN}Wordpress Setup Completed ${COLOR_RESET}"

exec php-fpm8.2 -F
