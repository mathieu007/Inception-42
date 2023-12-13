#!bin/bash
sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create    --allow-root \
                        --dbname=$SQL_DATABASE \
                        --dbuser=$SQL_USER \
                        --dbpass=$SQL_PASSWORD \
                        --dbhost=mariadb:3306 \
                        --path='/var/www/wordpress'

sleep 3

wp core install --allow-root \
                --url=$DOMAIN_NAME \
                --title=$SITE_TITLE \
                --admin_user=$ADMIN_USER \
                --admin_password=$ADMIN_PASSWORD \
                --admin_email=$ADMIN_EMAIL \
                --path='/var/www/wordpress'

sleep 3

wp user create  --allow-root \
                --role=author $USER1_LOGIN $USER1_MAIL \
                --user_pass=$USER_PASSWORD \
                --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d mkdir /run/php ]; then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F
