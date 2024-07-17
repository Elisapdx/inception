NAME			:=	inception
VERSION			:=	1.0
SRCS_DIR		:=	srcs

COMPOSE_FILE	:=	${SRCS_DIR}/docker-compose.yml
ENV_FILE		:=	${SRCS_DIR}/.env

FLAGS			:=	-f ${COMPOSE_FILE} \
					-p ${NAME}

LOGIN=epraduro
BASE = /Users
VOLUMES= $(BASE)/$(LOGIN)/data/database \
		 $(BASE)/$(LOGIN)/data/www \

all: setup build

setup:
	sudo bash -c 'cat /etc/hosts | grep $(LOGIN) &> /dev/null || echo "127.0.0.1 $(LOGIN).42.fr" >> /etc/hosts'
	sudo mkdir -p $(VOLUMES)

build:
	@docker compose ${FLAGS} up -d --build
start:
	@docker compose ${FLAGS} start > /dev/null

stop:
	@docker compose ${FLAGS} stop > /dev/null

status:
	@docker compose ${FLAGS} ps

clean:
	@rm -rf $(BASE)/$(LOGIN)/data/www/* > /dev/null
	@rm -rf $(BASE)/$(LOGIN)/data/database/* > /dev/null

fclean: clean
	@docker rmi -f nginx > /dev/null
	@docker rmi -f mariadb > /dev/null
	@docker rmi -f wordpress > /dev/null
	@docker rm -f nginx > /dev/null
	@docker rm -f mariadb > /dev/null
	@docker rm -f wordpress > /dev/null
	@docker volume rm -f inception_database > /dev/null
	@docker volume rm -f inception_www > /dev/null
	@docker network rm inception > /dev/null

re: stop fclean all

.PHONY: all start stop status fclean clean re