#!/usr/bin/gawk
function getResult(input, regex){
	split(input, arr, regex)
	split(arr[2], arr1, "</span>")
	return arr1[1]
}
BEGIN {
	nameRegex = "<span itemprop=\"name\">"
	addrRegex = "<span itemprop=\"streetAddress\">"
	phoneRegex = "<span itemprop=\"telephone\" style=\"display: none;\">"
	nameResult = ""
	addrResult = ""
	phoneResult = ""
}
{
	if (nameResult == ""){
		if (match($0, nameRegex)){
			nameResult = getResult($0, nameRegex)
		}
	}
	if (nameResult && addrResult == ""){
		if (match($0, addrRegex)){
			addrResult = getResult($0, addrRegex)
		}
	}
	if (addrResult && phoneResult == ""){
		if (match($0, phoneRegex)){
			phoneResult = getResult($0, phoneRegex)
		}
	}
}
END {
	printf("%s\n", nameResult) 
	printf("%s\n", addrResult) 
	printf("%s\n", phoneResult) 
}