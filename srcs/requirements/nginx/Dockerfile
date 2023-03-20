FROM debian:buster

# Install dependencies
RUN apt-get update 
RUN apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
# Install SSL
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl
RUN openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out /etc/nginx/ssl/www.nmattera.42.fr.crt -keyout /etc/nginx/ssl/www.nmattera.42.fr.key -subj "/C=FR/ST=Paris/CN=nmattera"
RUN chmod 777 /etc/nginx/ssl/*

# Config file
RUN mkdir -p /var/run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]