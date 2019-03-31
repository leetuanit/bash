#!/bin/bash
dbhost="127.0.0.1"
dbport="27017"
dbname="vtown"
mongo --eval "db = connect('$dbhost:$dbport/$dbname')"

RESULT=$?   # returns 0 if mongo eval succeeds

if [ $RESULT -ne 0 ]; then
    echo "mongodb not running"
    exit 1
else
    echo "mongodb running!"
fi
