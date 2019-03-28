#!/bin/bash
input="list_url.txt"
while IFS='' read -r line || [[ -n "$line" ]]; do
	curl $line -o html.txt
    awk -f parse.awk html.txt
done < "$input"