# Use the standard Nginx image from Docker Hub
FROM nginx:alpine

# Copy NGINX config
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./snippets /etc/nginx/snippets
ADD ./.htpasswd /etc/nginx/.htpasswd

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]