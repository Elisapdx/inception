#!/bin/bash

service mariadb restart

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -u root -e "CREATE USER \'$MYSQL_USER\'@'%' IDENTIFIED BY \'$MYSQL_PASSWORD\';"
mariadb -u root -e "GRANT ALL ON $MYSQL_DATABASE . * TO \'$MYSQL_USER\'@'%' IDENTIFIED BY \'$MYSQL_PASSWORD\';"
mariadb -u root -e "FLUSH PRIVILEGES;"