#!/bin/bash

clear

# Coverts .pdf to .txt
pdftotext -layout result_CHN.pdf result_CHN.txt

# Greps result of cs students
grep --no-group-separator -A3 "CHN18CS" result_CHN.txt > cs.txt

# Organises the data
tr  '\n' ' ' < cs.txt > nn.txt
sed 's/\t//g' nn.txt > na.txt
awk '{$1=$1;print}' na.txt > nn.txt
sed 's/CHN/\nCHN/g' nn.txt > na.txt
tr  ',' ' ' < na.txt > result.txt

# Convert Grades to Grade Points 
sed -i 's/(O)/ 10/g;s/(A+)/ 9/g;s/(A)/ 8.5/g;s/(B+)/ 8/g;s/(B)/ 7/g; s/(C)/ 6/g;s/(P)/ 5/g;s/(F)/ 0/g;s/(FE)/ 0/g;s/(I)/ 0/g;s/(Absent)/ 0/g' result.txt

# Seperates out roll no and grades
awk  '{  
	print $1,$3,$5,$7,$9,$11,$13,$15,$17,$19
 }' result.txt > gp.txt 

# Calculates cgpa
awk '{
	sum = 0
	flag = 0
	fail = 0
	for(i=2; i<=NF; i++)
	{
		if($i == 0)
		{
			fail = fail+1
			flag = 1
		}
		sum += $i
	}

	cgpa = sum/9
	if (flag == 0)
	{	
	 	printf("%s %0.2f\n",$1,cgpa)
	}
	if (flag == 1)
	{
		printf("%s failed in %d\n",$1,fails)
	}
}' gp.txt > cgpa_raw.txt

# Adds name and cgpa
join students.txt  cgpa_raw.txt > cgpa.txt
rm result.txt
rm cs.txt
rm na.txt
rm nn.txt
rm gp.txt

