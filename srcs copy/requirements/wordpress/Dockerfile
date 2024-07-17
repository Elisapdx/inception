FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y


RUN apt -y install wget
RUN apt -y install lsb-release apt-transport-https ca-certificates 
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update

RUN apt install -y \
	php7.2 \
	php7.2-fpm \
	php7.2-mysql \
	mariadb-client \
	wordpress \
	sendmail

RUN	apt install curl openrc -y

RUN rm -rf /etc/php/7.2/fpm/pool.d/www.conf
COPY conf/default.conf /etc/php/7.2/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html
# RUN adduser -u 82 -D -S -G www-data www-data
RUN chmod 777 -R /var/www/html
# RUN chown -R www-data:www-data /var/www/html

COPY ./conf/wp-config.php ./

COPY conf/wordpress.sh ./ 
RUN chmod +x ./wordpress.sh

EXPOSE 9000

ENTRYPOINT ["./wordpress.sh"]