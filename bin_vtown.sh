#!/bin/bash
input="listcompany.txt"
while IFS='.+\n' read -r line || [[ -n "$line" ]]; do
	curl $line -o html.txt
    content=$(awk -f parse_vtown.awk html.txt)
    printf "%s\n" "${content}"
    
done < "$input"
