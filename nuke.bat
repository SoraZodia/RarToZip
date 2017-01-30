@ECHO OFF
SETLOCAL EnableDelayedExpansion

FOR %%F IN (*) DO ( CALL :delFile "%%F" )
FOR /D %%G in (*) DO ( CALL :delDir "%%G" )

:delFile
SET name=%1

IF "!name!"=="" ( GOTO :EOF )
DEL /A:-H /Q %name%
ECHO Deleted %name%

GOTO :EOF

:delDir
SET name=%1

IF "!name!"=="" ( GOTO :EOF )
RD /S /Q %name%
ECHO Deleted %name%

GOTO :EOF