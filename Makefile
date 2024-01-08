# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: babieseater <babieseater@student.42.fr>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/22 15:54:05 by smayrand          #+#    #+#              #
#    Updated: 2024/01/07 17:59:41 by babieseater      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker compose -f ./srcs/docker-compose.yml up -d --build
	
dw:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm  $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\


re: clean all