#!/bin/bash
working_dir=`pwd`
function crawl(){
	array=()
	wget -qO- ${1} | awk -f ${working_dir}/parse_vtown_company.awk
}

while read vtownUrl
do
	crawl ${vtownUrl} | while read resultLine
	do
		line=`expr $line + 1`
		if [[ ${line} == 1 ]]; then
			echo $resultLine
		fi
		if [[ ${line} == 2 ]]; then
			echo $resultLine
		fi
		if [[ ${line} == 3 ]]; then
			echo $resultLine
		fi
	done
	echo $name
	echo $address
	echo $phone
done < "listcompany_url.txt"