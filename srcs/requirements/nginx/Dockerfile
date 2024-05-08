FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx openssl

RUN chmod 777 /etc/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/mbouyahy.pem \
        -keyout /etc/ssl/mbouyahy.key \
        -subj "/C=MA/ST=Med/L=Med/O=1337 School/OU=med/CN=med/"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
