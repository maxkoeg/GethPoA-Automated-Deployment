cd C:\chainspaceNetwork\bnode


@echo off

REM Run bootnode and capture the first line to a text file
for /f "delims=" %%i in ('powershell -Command "bootnode -nodekey './boot.key' -verbosity 7 -addr '127.0.0.1:30301' | Select-Object -First 1"') do set "first_line=%%i" & echo %%i > "output.txt"



REM Run bootnode again and display all output
powershell -Command "bootnode -nodekey './boot.key' -verbosity 7 -addr '127.0.0.1:30301'"


exit