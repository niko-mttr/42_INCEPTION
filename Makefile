NAME = inception

all: build

build:
	@echo "Building configuration ${NAME}\n"
	@bash srcs/requirements/wordpress/tools/mkdir_data.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up --build

down:
	@echo "Stopping configuration ${NAME}\n"
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down --volume

clean: down
	@echo "Cleaning configuration ${NAME}\n"
	@docker system prune -f
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY: all build down clean