@echo off
cd C:\ChainspaceNetwork\node1\

:input_loop
set /p "password1=Enter your password: "
set /p "password2=Confirm your password: "


if "%password1%"=="%password2%" (
@echo off  
  echo password confirmed
    goto :continue
) else (
    echo Input mismatch. Please try again.
    goto :input_loop
)

:continue

set "response1=%password1%"

REM Create a temporary file to hold the user responses
echo %response1% > user_input.txt
echo %response1% >> user_input.txt



REM Run the geth command and redirect input from the user_input.txt file
geth --datadir "./data" account new < user_input.txt > address.txt


REM Input file (the file you want to remove the first line from)
set "input_file=user_input.txt"

REM Output file (a temporary file to hold the result without the first line)
set "output_file=output.txt"

REM Use the for /f loop to skip the first line of the input file and copy the rest to the output file
(for /f "skip=1 delims=" %%i in (%input_file%) do echo %%i) > %output_file%

REM Replace the original file with the output file
move /y %output_file% %input_file%


REM Create a temporary file without the first seven lines
more +7 "address.txt" > "temp.txt"

REM Move the temporary file back to the original file
move /y "temp.txt" "address.txt"

REM Read the first line of the source file
set /p "first_line=" < "address.txt"

REM Write the first line to the destination file
echo %first_line% > "address.txt"

setlocal enabledelayedexpansion

REM Process each line in the input file
for /f "delims=" %%a in ('type "address.txt"') do (
    set "line=%%a"
    echo !line:~29!> "address.txt"
)

set inputFile=C:\ChainspaceNetwork\node1\address.txt

(for /f "usebackq delims=" %%A in ("%inputFile%") do (
    set "line=%%A"
    setlocal enabledelayedexpansion
    set "line=!line:~0,-1!"
    echo !line!
    endlocal
)) > "%inputFile%.temp"

move /y "%inputFile%.temp" "%inputFile%"

endlocal


set "password1=¯\_(ツ)_/¯"

set "password2=¯\_(ツ)_/¯"
