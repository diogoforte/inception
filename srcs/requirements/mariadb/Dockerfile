FROM debian:oldstable

RUN apt-get update -y && \
	apt-get install mariadb-server -y && \
	rm -rf /var/lib/apt/lists/*

COPY tools/start.sh .

EXPOSE 3306

CMD ["bash", "start.sh"]