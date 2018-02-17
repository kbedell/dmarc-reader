FROM nginx:1.12-alpine

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf
ADD nginx-app.conf /etc/nginx/conf.d/nginx-app.conf

# Delete the default welcome to nginx page.
RUN rm /usr/share/nginx/html/*

# Start nginx in the foreground to play nicely with Docker.
CMD ["nginx", "-g", "daemon off;"]
