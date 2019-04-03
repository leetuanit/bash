#!/bin/bash
working_dir=`pwd`
function crawl(){
	wget -qO- ${1} | awk -f ${working_dir}/parse_vtown_company.awk | while read name address phone; do
		echo ${name}
		echo ${address}
		echo ${phone}
	done
}
while read vtownUrl; do
	crawl ${vtownUrl}
done < "listcompany_url.txt"