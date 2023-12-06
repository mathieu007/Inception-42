FROM debian:buster

RUN apt-get update -y && apt-get -y install nginx

RUN apt install vim -y && apt install curl -y

RUN mkdir -p /etc/nginx/ssl &&  apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CA/ST=Quebec/L=Quebec City/O=42 School/OU=42Quebec/CN=smayrand.42.fr"

COPY  ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod /var/www/html

RUN chown -R www-data:www-data /var/www/html