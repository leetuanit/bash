#!/bin/sh
#Get current working directory via command line between this charactor ``
work_dir=`pwd`
#Read file content and pass the content to awk as a input.
#awk make the output and pass to another process.
cat ${work_dir}/phone_.html | awk -f phone.awk | while read var1 var2 var3
do
    echo $var1 $var2 $var3
done