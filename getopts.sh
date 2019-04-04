#!/bin/bash
h=0
a=0
b=0
c=0
while getopts "h:s:abc:" name; do
  case $name in
  	a) a=1
		  echo "a=$a"
		  ;;
  	b) b=1
  		echo "b=$b"
  		;;
  	c) c=1
  		echo "c=$c"
  		;;
    h) h=1
      echo "usage $h"
      let "h=5" 
      ;;
    s)
      strength=$OPTARG
      echo $strength
      ;;
  esac

  echo "\$#= $#" #The number of args input item
  echo "\$$= $$" #current pid
  echo "\$?= $?" #Exit code
  echo "\$*= $*" #All args input
done
echo "h=$h"