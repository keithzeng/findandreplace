@echo off & setlocal enabledelayedexpansion
set INPUT=old1.txt
set OUTPUT=new1.txt
set PROP=tokens.properties

::Main function, pass three argument as the name suggested
call :untokenize %INPUT% %OUTPUT% %PROP%
goto :eof

::Helper functions
:untokenize
set input=%1
set output=%2
set prop=%3
del %output%
for /f "delims=" %%A in ( '"findstr /n ^^ %input%"') do (
	set string=%%A
	for /f "delims=: tokens=1,*" %%a in ("!string!") do set "string=%%b"
	if  "!string!" == "" (
		echo.>>%output%
	) else (
		call :replace "!string!" %prop%
		echo !line!>> %output%
	)
)
:: remove goto :eof if you want the same file name
goto :eof
del %input%
rename %output% %input%
goto :eof

:replace
set line=%~1
for /f "tokens=1,2 delims==" %%G in (%~2) do (
	set line=!line:%%G=%%H!
)
goto :eof
