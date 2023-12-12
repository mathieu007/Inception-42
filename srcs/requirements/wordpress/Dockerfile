FROM debian:buster

RUN apt-get update -y && apt-get -y install wget

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN apt install vim -y && apt install curl -y

RUN wget https://fr.wordpress.org/wordpress-6.0.6-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0.6-fr_FR.tar.gz && rm wordpress-6.0.6-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY ./tools/www.conf etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp