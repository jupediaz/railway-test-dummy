# Simple test Dockerfile
FROM nginx:alpine

# Copy our simple HTML file
COPY index.html /usr/share/nginx/html/

# Create nginx config template that listens on $PORT
RUN echo 'server { listen $PORT; location / { root /usr/share/nginx/html; index index.html; try_files $uri $uri/ =404; } }' > /etc/nginx/conf.d/default.conf.template

# Start script that substitutes PORT and starts nginx
RUN echo '#!/bin/sh' > /start.sh && \
    echo 'echo "Starting with PORT: $PORT"' >> /start.sh && \
    echo 'envsubst \$PORT < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf' >> /start.sh && \
    echo 'echo "Generated nginx config:"' >> /start.sh && \
    echo 'cat /etc/nginx/conf.d/default.conf' >> /start.sh && \
    echo 'nginx -g "daemon off;"' >> /start.sh && \
    chmod +x /start.sh

CMD ["/start.sh"]