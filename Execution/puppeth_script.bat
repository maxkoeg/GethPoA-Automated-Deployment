cd C:\ChainspaceNetwork\

echo networknamehere > "Genesis_config.txt"
echo 2 >> "Genesis_config.txt"
echo 1 >> "Genesis_config.txt"
echo 2 >> "Genesis_config.txt"
echo 15 >> "Genesis_config.txt"
cd C:\ChainspaceNetwork\node1\

REM sealing node


@echo off
setlocal enabledelayedexpansion

set "inputFile=C:\ChainspaceNetwork\node1\address.txt"
set "outputFile=C:\ChainspaceNetwork\susfile.txt"

REM Read each line from the input file, skip the first two characters, and write to the output file
for /f "usebackq delims=" %%A in ("%inputFile%") do (
    set "line=%%A"
    echo !line:~2! >> "%outputFile%"
)

endlocal

endlocal

timeout /t 3 > nul

cd C:\ChainspaceNetwork\

type "C:\ChainspaceNetwork\susfile.txt" >> "C:\ChainspaceNetwork\Genesis_config.txt"
echo Text from %sourceFile% appended to %targetFile%


echo. >> "Genesis_config.txt"
echo. >> "Genesis_config.txt"
echo yes >> "Genesis_config.txt"

REM network ID

set /p "NetworkID=Enter an avalable Network ID (numeric), Keep in mind failure to enter available network ID will not result in immidiate error but network conflictions later on (no leading zeros):"

echo %NetworkID% > "NetworkID.txt"

echo %NetworkID% >> "Genesis_config.txt"
echo 2 >> "Genesis_config.txt"
echo 2 >> "Genesis_config.txt"
echo. >> "Genesis_config.txt"

puppeth < Genesis_config.txt

cd C:\ChainspaceNetwork\node1\
geth --datadir ./data init ../networknamehere.json

cd C:\ChainspaceNetwork\node2\
geth --datadir ./data init ../networknamehere.json




