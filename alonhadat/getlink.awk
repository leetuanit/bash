BEGIN {

}
{
	if (index($0,"<a href='/")) {
		split($0,a1,"html'><< xem chi tiết >></a>")
		print("href========================",a1[1]) 
	}
}
END {

}

