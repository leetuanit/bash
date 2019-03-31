#!/bin/bash
filename="content"
referer_url="https://alonhadat.com.vn"

for (( i = 0; i < 7000; i++ )); do
	page=$i
	url="https://alonhadat.com.vn/can-ban-nha/trang-$page.htm"
	echo $url
	curl --referer $referer_url $url -o $filename".txt" --progress
	awk '/\/[a-z-0-9]+-\d{3,7}.html/' content.txt
done

