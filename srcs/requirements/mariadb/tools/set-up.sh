#!/bin/bash

service mariadb start

root=1234

sleep 1

if [ -d "/var/lib/mysql/$MARIADB_DATABASE" ]
then 

	echo "Database already exists"
else
	mariadb -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
        mariadb  -e "CREATE USER IF NOT EXISTS ${MARIADB_USER}@'localhost' IDENTIFIED BY '$(< ${MARIADB_PASSWORD})';"
        mariadb -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '$(< ${MARIADB_PASSWORD})';"
        mariadb -u root -e " SET PASSWORD = PASSWORD('$(< ${MARIADB_ROOT_PASSWORD})');"
        mariadb -e "FLUSH PRIVILEGES;"
fi

service mariadb stop

mysqld_safe
