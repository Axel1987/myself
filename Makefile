include .env

all: | ${APP_ENV}
dev: | docker-build docker-up composer-install
prod: | docker-build docker-up composer-install

##### composer #####

composer-install:
	docker-compose -f docker-compose-dev.yml exec php composer install

create-symphony-project:
	docker-compose -f docker-compose-dev.yml exec php composer create-project symfony/website-skeleton /api

##### docker compose dev #####

docker-build:
	docker-compose -f ${COMPOSE_FILE_OPTION} build

docker-up:
docker-up:
	docker-compose -f ${COMPOSE_FILE_OPTION} up
