@ECHO OFF

FOR %%G IN (*.rar) DO ( CALL :convert "%%G" )

:convert
SET file=%1
SET name=%file:.rar=%

FOR /f "useback tokens=*" %%A IN ('%file%') DO SET file=%%~A
FOR /f "useback tokens=*" %%A IN ('%name%') DO SET name=%%~A

IF "%file%"=="" (GOTO :EOF)

7z x "%file%" -o.\"%name%"
7z a "%name%.zip" .\"%name%"\*
RD /S /Q .\"%name%"\
ECHO Deleted %name%

REM DEL /Q .\"%file%"
REM ECHO Deleted %file%

GOTO :EOF
