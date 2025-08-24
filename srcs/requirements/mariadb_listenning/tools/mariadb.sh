#!/bin/bash

service mariadb start;

sleep 5;

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS \`${WP_DB}\`;
CREATE USER IF NOT EXISTS \`${DB_USR}\`@'%' IDENTIFIED BY '${DB_PSWD}';
GRANT ALL PRIVILEGES ON \`${WP_DB}\`.* TO '${DB_USR}'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${DB_ADM_PSWD}' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"${DB_ADM_PSWD}" shutdown;

exec mysqld_safe;
