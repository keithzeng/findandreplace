I. Use of batch file, _findandreplace.bat<br />
Usage-> call :untokenize %INPUT% %OUTPUT% %PROP%<br />
<br />
Call the function :untokenize with three arguments<br />
	1.	input file that you want to update<br />
	2.	output file name that you desired<br />
	3.	tokens.properties with "=" for delimiter<br />
<br />
<br />
II. Use of VBScript file, findandreplace.vbs<br />
Usage-> Set cache = createKeyVal(prop_path)<br />
		where prop_path = where you have you tokens properties<br />
<br />	
	Then Call untokenize(file,cache)<br />
		where file = file you want to untokenize<br />
		      cache = the dictionary object from above step<br />
<br />
So basically, both scripts do following:<br />
	1.	loop through all the lines in the input file<br />
	2.	immediately look through all the key value pair in the tokens properties<br />
	3.	replace the all the keys found on the line with their respective value<br />
	4.	save the output to the output file<br />
So this does the same thing as the bat file, but it provides better handling of the XML file.<br />
Batch script doesn't work too well with all the ^ < % symbols.<br />