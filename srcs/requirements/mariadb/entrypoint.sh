#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=socket


mysqld_safe --datadir=/var/lib/mysql/

mariadb -e "CREATE DATABASE ${WP_DB}"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_USR}.* TO '${DB_USR}'@'localhost' IDENTIFIED BY '${DB_PSWD}'"
mariadb -e "FLUSH PRIVILEGES"
mariadb -e "EXIT"
mariadb -e "SHUTDOWN"

mysqld_safe --datadir=/var/lib/mysql/