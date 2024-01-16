# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: babieseater <babieseater@student.42.fr>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/22 15:54:05 by smayrand          #+#    #+#              #
#    Updated: 2024/01/15 17:10:01 by babieseater      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DATA_DIR =  /home/${USER}/data
WORDPRESS_DIR =  $(DATA_DIR)/wordpress/
MARIADB_DIR   =  $(DATA_DIR)/mariadb/
all: build up

build:
	@if [ ! -d $(DATA_DIR) ]; then \
        sudo mkdir -p $(DATA_DIR); \
        echo "Directory $(DATA_DIR) created."; \
    fi
	@if [ ! -d $(WORDPRESS_DIR) ]; then \
        sudo mkdir -p $(WORDPRESS_DIR); \
        echo "Directory $(WORDPRESS_DIR) created."; \
    fi
	@if [ ! -d $(MARIADB_DIR) ]; then \
        sudo mkdir -p $(MARIADB_DIR); \
        echo "Directory $(MARIADB_DIR) created."; \
    fi
	docker compose -f ./srcs/docker-compose.yml up -d --build


up:
	docker-compose -f ./srcs/docker-compose.yml up -d

dw:
	docker compose -f ./srcs/docker-compose.yml down

prune: dw
	sudo rm -rf $(WORDPRESS_DIR)
	sudo rm -rf $(MARIADB_DIR)
	docker-compose -f ./srcs/docker-compose.yml down --remove-orphans --volumes
	# docker image prune -a -f
	docker system prune -f

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm  $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\


re: clean all