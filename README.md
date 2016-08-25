##I. Use of batch file, _findandreplace.bat<br />
  1. Usage ->call :untokenize %INPUT% %OUTPUT% %PROP%<br />
  2. Parameters:
    a. input file that you want to update<br />
    b. output file name that you desired<br />
    c. tokens.properties with "=" as delimiter<br />
<br />

##II. Use of VBScript file, findandreplace.vbs<br />
  1. Usage -> Set cache = createKeyVal(prop_path)<br />
              Call untokenize(file,cache)<br />
  2. Parameters:
    a. prop_path = where you have you tokens properties<br />
    b. cache = the dictionary object from above step<br />
    c. file = file you want to untokenize<br />
		      
<br />
##Notes<br />
Both scripts do following:<br />
  1. loop through all the lines in the input file<br />
  2. immediately look through all the key value pair in the tokens properties<br />
  3. replace the all the keys found on the line with their respective value<br />
  4. save the output to the output file<br />

but VBS file provides better handling of the XML file then batch file does.<br />
Batch script doesn't work too well with all the ^ < % symbols.<br />