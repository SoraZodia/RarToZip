@ECHO OFF

SET f=%1

FOR %%G IN (*.rar) DO ( CALL :convertRAR "%f%" "%%G" )
FOR %%G IN (*.7z) DO ( CALL :convert7z "%f%" "%%G" )

:convertRAR
SET file=%~2
SET name=%file:.rar=%

IF "%file%"=="" ( GOTO :EOF )

7z x "%file%" -o.\"%name%"
7z a "%name%.zip" .\"%name%"\*
RD /S /Q .\"%name%"\
ECHO Deleted folder %name%

IF /I NOT "%~1"=="keep" ( 
DEL /Q .\"%file%"
ECHO Deleted %file% 
)

GOTO :EOF

:convert7z
SET file=%~2
SET name=%file:.7z=%

IF "%file%"=="" ( GOTO :EOF )

7z x "%file%" -o.\"%name%"
7z a "%name%.zip" .\"%name%"\*
RD /S /Q .\"%name%"\
ECHO Deleted folder %name%

IF /I NOT "%~1"=="keep" ( 
DEL /Q .\"%file%"
ECHO Deleted %file% 
)

GOTO :EOF
