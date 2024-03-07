NAME = inception

build: 
	docker-compose -f srcs/docker-compose.yml up --build -d

start: 
	docker-compose -f srcs/docker-compose.yml start

stop: 
	docker-compose -f srcs/docker-compose.yml stop

clean: 
	docker-compose -f srcs/docker-compose.yml down --volumes --rmi all

fclean: clean
	docker system prune -a --volumes --force
	docker network ls -q -f "driver=custom" | xargs -r docker network rm 2>/dev/null
	sudo rm -rf /home/dinunes-/data/mysql/*
	sudo rm -rf /home/dinunes-/data/wordpress/*

re: fclean build

info:
	@echo "Containers:"
	@docker ps -a

connect-mariadb:
	docker exec -it mariadb mysql -u root -p

connect-wordpress:
	docker exec -it wordpress /bin/bash

.PHONY: build up down clean fclean re info connect