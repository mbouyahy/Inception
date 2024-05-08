CREATE_DIR = sh ./srcs/requirements/tools/initialization.sh
DELETE_DIR = sh ./srcs/requirements/tools/cleaning.sh

all:
	$(CREATE_DIR)
	sudo docker compose -f ./srcs/docker-compose.yml build
	sudo docker compose -f ./srcs/docker-compose.yml up

build:
	$(CREATE_DIR)
	sudo docker compose -f ./srcs/docker-compose.yml build

up: build
	sudo docker compose -f ./srcs/docker-compose.yml up

down:
	sudo docker compose -f ./srcs/docker-compose.yml down
	sudo docker compose -f ./srcs/docker-compose.yml down -v

clean:
	sudo docker stop $(docker ps -qa) || true
	sudo docker compose -f ./srcs/docker-compose.yml down
	sudo docker compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	$(DELETE_DIR)
	sudo docker rmi -f $(sudo docker images -q) || true
	sudo docker system prune -f
	sudo docker volume prune -f

re: fclean all

.PHONY: all clean fclean re build up down