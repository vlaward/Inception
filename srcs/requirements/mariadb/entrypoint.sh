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
echo "/run/mysqld permissions incoming"
chown -R mysql:mysql /run/mysqld

#create the directory for the db data for sqld and give the right to the right user

if [ -d "/var/lib/mysql" ]; then
	echo "/var/lib/mysql already present"
else
	echo "/var/lib/mysql not existing, creating it"
	mkdir -p /var/lib/mysql
fi
echo "/var/lib/mysql permissions incoming"
chown -R mysql:mysql /var/lib/mysql


ls /var/lib/mysql
ls /run/mysqld
# mysql -u root -p  <======= ask for root mdp for a litle status info

#installation help for your server
mariadb-install-db --user=mysql --datadir="/var/lib/mysql" --socket=/run/mysqld/mysqld.sock


#create a tmp file to create the data base
cat << EOF > tmpfile
CREATE DATABASE $WP_DB;
GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USR'@'wordpress' IDENTIFIED BY '$WP_PSWD';
FLUSH PRIVILEGES;
EOF

/usr/bin/mariadbd --user=mysql < tmpfile
rm -rf tmpfile

/usr/bin/mariadbd --user=mysql --socket=/run/mysqld/mysqld.sock &
PID="$!"
#vraiment question de gerer les mdp un jours, azy j'ai le temps en vrais de vrais 
kill "${PID}"
exec /usr/bin/mariadbd --user=mysql 