#!/bin/bash
dbhost="127.0.0.1"
dbport="3306"
dbuser="tuanlm"
dbpass="123456"
dbname="bash"
mysql_connected(){
	mysql -h$dbhost -P$dbport -u$dbuser -p$dbpass -e "$1"
}
mysql_db_connected() {
	mysql -h$dbhost -P$dbport -u$dbuser -p$dbpass -D$dbname -e "$1"
}