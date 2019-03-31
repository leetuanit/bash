BEGIN {
 	pass1 = 0
 	pass2 = 0
 	title = ""
 	address = ""
 	tel = ""
}
 
{
	if (index($0,"<h1>") > 0) {
		split($0,a1,"<h1>")
		split(a1[2],a2,"</h1>")
		title = a2[1]
		pass1 = 1
	}
	if (pass1) {
		if (index($0,"<span itemprop=\"streetAddress\">")) {
			split($0,a1,"<span itemprop=\"streetAddress\">")
			split(a1[2],a2,"</span>")
			address = a2[1]
			pass2 = 1
		}
	}
	if (pass2) {
		if (index($0,"<span itemprop=\"telephone\" style=\"display: none;\">")) {
			split($0,a1,"<span itemprop=\"telephone\" style=\"display: none;\">")
			split(a1[2],a2,"</span>")
			tel = a2[1]
		}
	}
}
 
END {
	print title
	print address
	print tel
}