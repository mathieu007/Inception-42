#!/bin/bash

service mysql start;

#Test
#echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db1.sql
#echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> db1.sql
#echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db1.sql
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
#echo "FLUSH PRIVILEGES;" >> db1.sql

#mysql < db1.sql

#kill $(cat /var/run/mysqld/mysqld.pid)

#mysqld

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
