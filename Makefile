include .env

all: | ${APP_ENV}
dev: | docker-build docker-up composer-install
prod: | docker-build docker-up composer-install

##### composer #####

composer-install:
	docker-compose -f ${COMPOSE_FILE_OPTION} exec php composer install

##### docker compose #####
docker-build:
	docker-compose -f ${COMPOSE_FILE_OPTION} build

docker-up:
	docker-compose -f ${COMPOSE_FILE_OPTION} up -d
