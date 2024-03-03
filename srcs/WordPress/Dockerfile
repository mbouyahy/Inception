# FROM debian:latest


# # Download and extract WordPress
# RUN apt update && apt upgrade -y && \ 
# 	apt install -y wget unzip php-fpm && \
#     sudo sed -i 's/^listen = .*/listen = 127.0.0.1:9000/' /etc/php/{version}/fpm/pool.d/www.conf
# 	wget -P /var/www/html/ https://wordpress.org/latest.zip && \
#     unzip /var/www/html/latest.zip -d /var/www/html/ && \
#     rm /var/www/html/latest.zip

# # Set up Nginx configuration for WordPress
# # COPY /var/www/html/wordPress /usr/share/nginx/html/
# # COPY ./dependencies/wp-config.php /var/www/html/wp-config-sample.php

# # Expose port 80 for HTTP traffic
# EXPOSE 9000

# # Start Nginx and PHP-FPM
# # CMD ["nginx", "-g", "daemon off;"]

FROM debian:latest


# Update package lists and install necessary tools
RUN apt update && \
    apt upgrade -y && \ 
    apt install -y wget unzip php-fpm && \
    apt clean

# Configure PHP-FPM to listen on port 9000
RUN sed -i 's/^listen = .*/listen = 127.0.0.1:9000/' /etc/php/{version}/fpm/pool.d/www.conf

# Download and extract WordPress
RUN wget -P /var/www/html/ https://wordpress.org/latest.zip && \
    unzip /var/www/html/latest.zip -d /var/www/html/ && \
    rm /var/www/html/latest.zip

# Expose port 9000 for PHP-FPM
EXPOSE 9000

CMD ["php-fpm8.2", "-F", "-R"]
