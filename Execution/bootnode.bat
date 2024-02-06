@echo off
cd C:\ChainspaceNetwork\bnode\
bootnode -genkey boot.key
timeout /t 3 > nul

REM Run the first command and capture its first line using PowerShell
start C:\Gethpoa\execution\enode.bat\

timeout /t 5 > nul

set /p "first_line=" < "output.txt"


timeout /t 5 > nul



REM Your other batch commands here (they will continue running)

REM Use the environment variable where needed (e.g., echo it)
echo Enode URL: %first_line%

cd C:\ChainspaceNetwork\

setlocal enabledelayedexpansion

set "fileContent="
for /f "usebackq delims=" %%a in ("NetworkID.txt") do (
    set "NetworkID=%%a"
)


cd C:\ChainspaceNetwork\node1\
setlocal enabledelayedexpansion

set "fileContent="
for /f "usebackq delims=" %%a in ("address.txt") do (
    set "fileContent=!fileContent!%%a"
)

start cmd /k geth --networkid %NetworkID% --datadir "./data" --bootnodes %first_line% --port 30303 --ipcdisable --syncmode full --http --allow-insecure-unlock --http.corsdomain "*" --http.port 8545 --unlock %fileContent% --password user_input.txt --mine console

cd C:\ChainspaceNetwork\node2\
setlocal enabledelayedexpansion

set "fileContent1="
for /f "usebackq delims=" %%a in ("address.txt") do (
    set "fileContent1=!fileContent1!%%a"
)
start cmd /k geth --networkid %NetworkID% --datadir "./data" --bootnodes %first_line% --port 30304 --ipcdisable --syncmode full --http --allow-insecure-unlock --http.corsdomain "*" --http.port 8546 --unlock %fileContent1% --password user_input.txt console --authrpc.port 8554

exit