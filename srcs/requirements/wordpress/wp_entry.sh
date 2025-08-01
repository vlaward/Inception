#!/bin/sh

if [ -d "/var/www/wordpress" ]; then
	echo "/var/www/wordpress already present"
else
	echo "/var/www/wordpress not existing, creating it"
	mkdir -p /var/www/wordpress
fi
echo "/var/www/wordpress permissions incoming"
chown -R nginx:nginx /var/www/wordpress
chown -R nginx:www-data /var/www/wordpress

apk search php | grep fpm

mkdir -p /usr/logs/php-fpm
# ls /usr/bin
exec /usr/bin/php8