Usage-> call :untokenize %INPUT% %OUTPUT% %PROP%

Call the function :untokenize with three arguments
	1.	input file that you want to update
	2.	output file name that you desired
	3.	tokens.properties with "=" for delimiter
	

So basically, this batch file does following:
	1.	loop through all the lines in the input file
	2.	immediately look through all the key value pair in the tokens properties
	3.	replace the all the keys found on the line with their respective value
	4.	save the output to the output file