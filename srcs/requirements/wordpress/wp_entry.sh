#!/bin/sh


echo "Waiting for database..."
sleep 6;

# until mysqladmin ping -h "mariadb:3306" --silent; do
#   echo "Waiting for database..."
#   sleep 2
# done

php-fpm8 -F