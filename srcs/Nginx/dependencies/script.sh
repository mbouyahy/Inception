#!/bin/bash

# Test NGINX configuration
sudo nginx -t

# If the NGINX configuration is successful, reload NGINX
# if [ $? -eq 0 ]; then
    sudo systemctl reload nginx
    # echo "NGINX configuration reloaded successfully."
# else
    # echo "Error: NGINX configuration test failed. Please check nginx.conf for syntax errors."
# fi
