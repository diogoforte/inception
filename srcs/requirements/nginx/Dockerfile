FROM debian:oldstable

RUN apt-get update &&\
	apt-get install -y nginx openssl &&\
	rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/sites-available/default

RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	-keyout /etc/nginx/ssl/dinunes-.key \
    -out /etc/nginx/ssl/dinunes-.crt \
	-subj "/C=PT/L=Lisbon/O=42Lisboa/OU=dinunes-/CN=dinunes-.42.fr" 

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]