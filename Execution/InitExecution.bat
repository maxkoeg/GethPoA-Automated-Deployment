@echo off

set "source_file=C:\GethPoA\Geth"
set "destination_folder=C:\Program Files (x86)"

move "%source_file%" "%destination_folder%"

cd C:\
mkdir ChainspaceNetwork
cd ChainspaceNetwork
mkdir node1
mkdir node2
mkdir bnode

cd C:\GethPoA\Execution\

call node1_config.bat

cd C:\GethPoA\Execution\

call node2_config.bat

cd C:\GethPoA\Execution\

call puppeth_script.bat

cd C:\GethPoA\Execution\

start bootnode.bat



exit



