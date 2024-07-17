#!/bin/bash

# # mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
# # mysqld --user=root --datadir=/var/lib/mysql & sleep 2

# service mysql restart

# mysql --user=root -e "CREATE DATABASE IF NOT EXISTS \'${MYSQL_DATABASE}\';"
# mysql --user=root -e "CREATE USER \'${MYSQL_USER}\'@'localhost' IDENTIFIED BY \'${MYSQL_PASSWORD}\';"
# mysql --user=root -e "GRANT PRIVILEGE ON \'${MYSQL_DATABASE}\' . * TO \'${MYSQL_USER}\'@'localhost' IDENTIFIED BY \'${MYSQL_PASSWORD}\';"
# mysql --user=root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY \'${MYSQL_ROOT_PASSWORD}\';"
# mysql --user=root -e "FLUSH PRIVILEGES;"

# # mysqld --user=root --datadir=/var/lib/mysql

service mariadb restart

# mariadb -u root -e \
# 	"CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
# 	CREATE USER '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD'; \
# 	GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
# 	FLUSH PRIVILEGES;"

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \'${MYSQL_DATABASE}\';"
mariadb -u root -e "CREATE USER \'${MYSQL_USER}\'@'localhost' IDENTIFIED BY \'${MYSQL_PASSWORD}\';"
mariadb -u root -e "GRANT PRIVILEGE ON \'${MYSQL_DATABASE}\' . * TO \'${MYSQL_USER}\'@'localhost' IDENTIFIED BY \'${MYSQL_PASSWORD}\';"
# mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY \'${MYSQL_ROOT_PASSWORD}\';"
mariadb -u root -e "FLUSH PRIVILEGES;"