FROM debian:oldstable

RUN     apt update && \
		apt install -y  \
		php php-mysql \
		php-fpm php-curl \
		php-gd php-intl \
		php-mbstring php-soap \
		php-xml php-xmlrpc \
		php-zip mariadb-server \
		mariadb-client wget && \
		rm -rf /var/lib/apt/lists/* && \
		mkdir -p /var/www/html

COPY	tools/start.sh /
COPY	conf/www.conf /etc/php/7.4/fpm/pool.debian
COPY 	conf/wp-config.php .
RUN		chmod 777 start.sh

EXPOSE 9000

CMD ["bash", "start.sh"]