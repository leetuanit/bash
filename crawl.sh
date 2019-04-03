#!/bin/bash
working_dir=`pwd`
function crawl(){
	wget -qO- ${1} | awk -f ${working_dir}/parse.awk | while read name address phone; do
		echo ${name}
		echo ${address}
		echo ${phone}
	done
}
crawl http://vtown.vn/company/hoang-ha-office-stationery-co-ltd.html