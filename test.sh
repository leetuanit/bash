#!/bin/bash
work_dir=`pwd`
echo $work_dir
if [[ -s ${work_dir}/list.txt ]]; then
	echo "Condition 1: The file ${work_dir}/list.txt is not empty"
fi

if [[ ! -s ${work_dir}/list.txt ]]; then
	echo "Condition 2: The file ${work_dir}/list.txt is empty"
fi