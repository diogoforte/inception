FROM debian:oldstable

RUN apt-get update &&\
	apt-get install -y nginx openssl &&\
	rm -rf /var/lib/apt/lists/* && \
	mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/conf.d
COPY tools/start.sh .

EXPOSE 443

CMD ["bash", "start.sh"]