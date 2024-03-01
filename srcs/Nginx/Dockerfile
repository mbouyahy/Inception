# Use the official Debian as the base image
FROM debian:latest

# Copy the script into the image
# COPY ./dependencies/script.sh /usr/local/bin/script.sh

COPY ./dependencies/default.conf /etc/nginx/conf.d/default.conf

# Make the script executable
# RUN chmod +x /usr/local/bin/script.sh

# Run commands to update and install NGINX, clean up, then execute the script
RUN apt-get update && \
    apt-get install -y nginx && \
	apt-get install -y openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#    ssl_certificate /etc/ssl/certs/certificate.crt;
    # ssl_certificate_key /etc/ssl/certs/private.key;

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/private.key \
    -out /etc/ssl/certs/certificate.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Organizational Unit/CN=example.com"

EXPOSE 443

# Specify the script to execute when the container starts
# ENTRYPOINT ["/usr/local/bin/script.sh"]
CMD ["nginx", "-g", "daemon off;"]

# # Use the official Debian as the base image
# FROM debian:latest

# COPY ./dependencies/script.sh /usr/bin/

# RUN chmod +x usr/bin/script.sh

# # Update package index and install NGINX
# RUN apt-get update && \
#     apt-get install -y nginx && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# # Expose port 80 to allow incoming traffic
# EXPOSE 80

# # Command to start NGINX when the container starts
# # CMD ["nginx", "-g", "daemon off;"]
# CMD ["usr/bin/script.sh"]