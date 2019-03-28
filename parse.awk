BEGIN {
 	pass1 = 0
	print "Let's start"
	title = ""
	date = ""
	price = ""
	square = ""
	address = ""
}
 
{
	if (index($0,"<h1>") > 0) {
		split($0,a1,"<h1>")
		split(a1[2],a2,"</h1>")
		title = a2[1]

		split(a2[2],a3,"<span class='date'>Ngày đăng:")
		split(a3[2],a4,"</span>")
		date = a4[1]

		pass1 = 1
	}
	if (pass1) {
		if (index($0,"class='moreinfor'")) {
			split($0,a1,"<span class='price'>")
			split(a1[2],a2,"<span class='value'>")
			split(a2[2],a3,"</span>")
			price = a3[1]

			split($0,a1,"<span class='square'>")
			split(a1[2],a2,"<span class='value'> ")
			split(a2[2],a3,"m<sup>2</sup></span>")
			square = a3[1]

			split($0,a1,"<div class='address'>")
			split(a1[2],a2,"<span class='value'>")
			split(a2[2],a3,"</span>")
			address = a3[1]

			#print a1[1]
		}
	}
}
 
END {
	print ("Title:", title)
	print ("Date:", date)
	print ("Price:", price)
	print ("Square:", square)
	print ("Address:", address)
	print "The end"
}