# Use the official Debian as the base image
FROM debian:latest


# Run commands to update and install NGINX, clean up, then execute the script
RUN apt-get update && \
    apt-get install -y nginx && \
	apt-get install -y openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/private.key \
    -out /etc/ssl/certs/certificate.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Organizational Unit/CN=example.com"

RUN rm -rf /usr/share/nginx/html/*

COPY ./dependencies/default.conf /etc/nginx/conf.d/default.conf

# COPY ../web-test/ /usr/share/nginx/html

EXPOSE 443

# Specify the script to execute when the container starts
CMD ["nginx", "-g", "daemon off;"]
