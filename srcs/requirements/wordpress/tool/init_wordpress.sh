#!/bin/sh

WORDPRESS_ADMIN_PASSWORD=$(awk -F":" '{print $1}' /run/secrets/credentials)
WORDPRESS_PASSWORD=$(awk -F":" '{print $2}' /run/secrets/credentials)

sleep 5
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv -f wp-cli.phar /usr/local/bin/wp
chmod 777 -R /usr/local/bin/wp
rm -rf /var/www/html/wp-config-sample.php
cp ./wp-config.php /var/www/html/wp-config.php
wp --allow-root --info
wp core download --allow-root --path="/var/www/html"
wp core install \
	--allow-root \
	--path="/var/www/html" \
	--url=${WORDPRESS_HOST} \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL} \
	--skip-email
wp user create \
	--allow-root \
	--path="/var/www/html" \
	${WORDPRESS_USER} \
	${WORDPRESS_EMAIL} \
	--role='author' \
	--user_pass=${WORDPRESS_PASSWORD}
exec	php-fpm7.2 -F