#!/bin/sh

service mariadb start 


sleep 2

echo "CREATE DATABASE IF NOT EXISTS $BDD_NAME;" | mysql

echo "CREATE USER IF NOT EXISTS '$BDD_USER'@'%' IDENTIFIED BY '$BDD_USER_PASSWORD';" | mysql

echo "GRANT ALL PRIVILEGES ON *.* TO '$BDD_USER'@'%' IDENTIFIED BY '$BDD_USER_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$BDD_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$BDD_ROOT_PASSWORD';" | mysql
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
