FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./tools/50_server.conf /etc/mysql/mariadb.conf.d/

CMD /usr/bin/mysqld_safe