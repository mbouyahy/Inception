FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean

RUN mkdir -p /run/mysqld && \
	chmod 777 /run/mysqld

RUN chmod 777 /var/lib/mysql
RUN chmod -R 755 /var/lib/mysql

COPY ./conf/script.sh /script.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["sh", "script.sh"]
