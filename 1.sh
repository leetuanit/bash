BEGIN {
	print "Name\tDesignation\tDepartment\tSalary";
}
{print $2,"\t",$3,"\t",$4,"\t",$NF;}
END {
	print "Report Generated\n--------------";
}