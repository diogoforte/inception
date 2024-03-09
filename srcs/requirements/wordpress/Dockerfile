FROM debian:oldstable

RUN     apt-get update && \
		apt-get install -y  \
		php php-mysql \
		php-fpm php-curl \
		php-gd php-intl \
		php-mbstring php-soap \
		php-xml php-xmlrpc \
		php-zip mariadb-server \
		mariadb-client wget && \
		rm -rf /var/lib/apt/lists/* && \
		mkdir -p /var/www/html && \
		mkdir -p /run/php/ && \
		mkdir -p /var/run/

COPY	tools/start.sh /
COPY	conf/www.conf /etc/php/7.4/fpm/pool.debian
COPY 	conf/wp-config.php /

EXPOSE 9000

CMD ["bash", "start.sh"]