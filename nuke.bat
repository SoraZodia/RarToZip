@ECHO OFF

FOR %%F IN (*) DO ( CALL :delFile "%%F" )
FOR /D %%G in (*) DO ( CALL :delDir "%%G" )

:delFile
SET name=%1

DEL /P /Q /A -H %name%
ECHO Deleted %name%

GOTO :EOF

:delDir
SET name=%1

RD /S /Q %name%
ECHO Deleted %name%

GOTO :EOF