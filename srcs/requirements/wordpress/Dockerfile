FROM debian:bookworm

RUN apt-get update && apt-get install -y php-mysql
RUN apt-get update && \
    apt-get install -y php8.2-cli \
	php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    curl \
    mariadb-client \
    sendmail \
    && sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

COPY ./conf/script.sh script.sh

ENTRYPOINT ["sh", "script.sh"]
