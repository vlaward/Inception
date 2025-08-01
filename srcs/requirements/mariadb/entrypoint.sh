#!/bin/sh

#se dermerdad

#define the socketfile : En soit c'est plus pars securitee en soit j'utrilise celui de base donc pas trop le besoin, mais you get it 

# create the directory for sqld and give the right to the right user
if [ -d "/run/mysqld" ]; then
	echo "/run/mysqld already present"
else
	echo "/run/mysqld not existing, creating it"
	mkdir -p /run/mysqld
fi
chown -R mysql:mysql /run/mysqld

#create the directory for the db data for sqld and give the right to the right user

if [ -d "/var/lib/mysql" ]; then
	echo "/var/lib/mysql already present"
else
	echo "/var/lib/mysql not existing, creating it"
	mkdir -p /var/lib/mysql
fi
chown -R mysql:mysql /var/lib/mysql


ls /var/lib/mysql
ls /run/mysqld
# mysql -u root -p

mariadb-install-db --user=mysql --datadir="/var/lib/mysql" --socket=/run/mysqld/mysqld.sock

# cat << EOF > tmpfile
# CREATE DATABASE wordpress;
# GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress password';
# FLUSH PRIVILEGES;
# EOF

# EXIT
/usr/bin/mariadbd --user=mysql &
PID="$!"
ls -l /run/mysqld/mysqld.sock
mariadb setup --socket=/run/mysqld/mysqld.sock
mysqladmin -u root password 'password' --socket=/run/mysqld/mysqld.sock

# /usr/bin/mariadb < tmpfile
# rm -f tmpfile
# perl /usr/mysql-test/mariadb-test-run.db

#self explainatory ain't it




# /usr/bin/mysqld_safe --datadir="/var/lib/mysql" --socket=/run/mysqld/mysqld.sock


# ps aux | grep mysqld



# # #vraiment question de gerer les mdp un jours, azy j'ai le temps en vrais de vrais 
# echo "mysqladmin INCOMING

kill "${PID}"
# exec /usr/bin/mariadbd --user=mysql 