#!/bin/bash
while getopts "h:s:" name; do
  case $name in
    h)
      echo "usage" 
      ;;
    s)
      strength=$OPTARG
      echo $strength
      ;;
  esac
done