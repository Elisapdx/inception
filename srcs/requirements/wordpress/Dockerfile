FROM debian:bullseye

RUN apt-get update -y 
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
	curl \
	openrc

RUN rm -rf /etc/php/7.2/fpm/pool.d/www.conf
COPY conf/default.conf /etc/php/7.2/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html
RUN chmod 777 -R /var/www/html

RUN chown -R www-data:www-data /var/www/html

COPY tool/init_wordpress.sh ./ 
RUN chmod +x ./init_wordpress.sh

COPY ./conf/wp-config.php ./wp-config.php

RUN mkdir /run/php/

RUN echo $WORDPRESS_PASSWORD >> test.txt

ENTRYPOINT ["./init_wordpress.sh"]