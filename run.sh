#!/bin/bash
source mysql.sh #include file
mysql_connected "show databases"
mysql_connected "drop database bash"
mysql_connected "show databases"
mysql_connected "create database bash"