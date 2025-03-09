service mariadb start 

sleep 2

echo "CREATE DATABASE IF NOT EXISTS $MDB_NAME;" | mysql

echo "CREATE USER IF NOT EXISTS '$MDB_USER'@'%' IDENTIFIED BY '$MDB_USER_PASSWORD';" | mysql

echo "GRANT ALL PRIVILEGES ON *.* TO '$MDB_USER'@'%' IDENTIFIED BY '$MDB_USER_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MDB_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MDB_ROOT_PASSWORD';" | mysql
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
