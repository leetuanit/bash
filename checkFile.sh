#!/bin/bash
#-r filenm	True nếu có quyền đọc filenm
#-w filenm	True nếu có quyền ghi trên filenm
#-x filenm	True nếu có quyền thực thi filenm
#-f filenm	True nếu filenm là regular file
#-d filenm	True nếu filenm là thư mục
#-c filenm	True nếu filenm là character special file
#-b filenm	True nếu filenm là block special file
#-s filenm	True nếu size of filenm # 0
#-t fnumb	True nếu fnumb (1 by default) là terminal device

work_dir=`pwd`
file=${work_dir}/list.txt
echo $work_dir
if [[ -s $file ]]; then
	echo "Condition 1: The file $file is not empty"
fi

if [[ ! -s ${work_dir}/list.txt ]]; then
	echo "Condition 2: The file $file is empty"
fi