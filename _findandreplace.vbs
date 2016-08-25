Function ForceConsole()
	If InStr(LCase(WScript.FullName), vbsInterpreter) = 0 Then
		oWSH.Run vbsInterpreter & " //NoLogo " & Chr(34) & WScript.ScriptFullName & Chr(34)
		WScript.Quit
	End If
End Function

Function printl(txt)
    WScript.StdOut.WriteLine txt
End Function

Function print(txt)
	WScript.StdOut.Write txt
End Function

Function scanf()
	scanf = LCase(WScript.StdIn.ReadLine)
End Function

Function wait(n)
    WScript.Sleep Int(n * 1000)
End Function

Function createKeyVal(ByVal propPath)
	Set file = fso.OpenTextFile(propPath)
	set cache = CreateObject("Scripting.Dictionary")
	Do Until file.AtEndOfStream
		line=file.ReadLine
		line = Trim(line)
		If Len(line) > 0 then
			lineArray=Split(line,"=")
			cache.Add lineArray(0),lineArray(1)
		End If
	Loop
	Set createKeyVal=cache
End Function

Function untokenize(ByVal filePath, ByRef dict)
	Set input = fso.OpenTextFile(filePath)
	text = input.ReadAll
	input.Close
	keys=cache.Keys
	For Each key in keys
		text = Replace(text,key,cache.Item(key))
	Next
	outFilePath=filePath+"_tmp"
	Set output = fso.CreateTextFile(outFilePath,True)
	output.Write text
	output.Close
	'Comment it out the below lines if you don't want to overwrite original file
	fso.DeleteFile(filePath)
	fso.MoveFile outFilePath,filePath
End Function

'Common setting
Set oWSH = CreateObject("WScript.Shell")
vbsInterpreter = "cscript.exe"
Call ForceConsole()
Set fso = CreateObject("Scripting.FileSystemObject")


'Entry of main function
Set cache = createKeyVal("tokens.properties")
Call untokenize("book.xml",cache)