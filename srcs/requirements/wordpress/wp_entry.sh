#!/bin/sh

echo "Waiting for database..."
sleep 10;

sed -i 's/^[; ]*phar\.readonly\s*=.*/phar.readonly = Off/' /etc/php*/php.ini


cd /var/www/wordpress


wp core download --allow-root

mv wp-config-sample.php wp-config.php
sed -i "s|database_name_here|${WP_DB}|" wp-config.php
sed -i "s|username_here|${DB_USR}|" wp-config.php
sed -i "s|password_here|${DB_PSWD}|" wp-config.php
sed -i "s|localhost|mariadb|" wp-config.php

wp core install \
	--url="ncrombez.42.fr" \
	--title="Inception" \
	--admin_user="nahla" \
	--admin_password="lepswd" \
	--admin_email="random@quequchose.com" \
	--skip-email \
	--allow-root

wp user create \
	"wprndboug" "random@lemail.co" \
	--user_pass="rndpswd" \
	--role=editor \
	--allow-root

# until mysqladmin ping -h "mariadb:3306" --silent; do
#   echo "Waiting for database..."
#   sleep 2
# done

php-fpm8 -F