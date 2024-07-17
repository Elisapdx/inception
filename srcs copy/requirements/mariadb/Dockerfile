FROM debian:bullseye

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server

RUN mkdir /var/lib/mysqld && chmod 777 /var/lib/mysqld

COPY ./conf/50-server.conf /etc/mysql/my.cnf

COPY conf/mariadb.sh ./

EXPOSE 3306

RUN chmod +x ./mariadb.sh
RUN ./mariadb.sh

CMD ["mysqld_safe"]