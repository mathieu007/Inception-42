FROM debian:buster

RUN apt-get update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY ./conf/50_server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#CMD /usr/bin/mysqld_safe

#CMD service mysql start