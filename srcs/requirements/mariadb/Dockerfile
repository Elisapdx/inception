FROM debian:bullseye

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server

RUN mkdir /var/lib/mysqld && chmod 777 /var/lib/mysqld

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./tool/init_mariadb.sh ./

RUN chmod +x ./init_mariadb.sh && ./init_mariadb.sh

CMD ["mysqld_safe", "--log-error=er.log"]