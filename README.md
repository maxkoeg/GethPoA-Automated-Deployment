# GethPoA-Automated-Deployment
This set of execution files automatically deploys a Proof-Of-Authority Ethereum Test Network Consisting of a bootnode, a sealer, and a general node.


### ***Overview:***

This execution set runs Geth version 1.10.26, this version was chosen due to the Pupeth genesis generation tool, further streamlining the initialization process and helping you get your network up quickly for that crucial development environment. This is the latest version still including this tool, any Geth updating will prevent proper execution. As of now, the program is only built for Windows, further compatibility may be included in future updates. 

The program creates a Clique, Proof of Authority Ethereum network, and allocates no starting Ether to any of the three initial accounts. JSON-RPC access is provided through localhost:8545 or 127.0.0.1:8545. No consensus/beacon client is required due to the nature of the network. Due to the way the network runs, it may not be a proper representation of current Ethereum mechanics, for the sake of simplicity consider this network depreciated but still useful for legacy and remaining Ethereum mechanics. 


### ***Initialization and Operation:***

All batch operations are found in the execution sub-directory of the GethPoA directory provided. There are two main files you need to focus on. When first initializing the network run the InitExecution file with administrative access. Once initiated and stopped again for maintenance or other purposes, you can resume the current network by running the bootnode batch file. The bootnode file starts the network without regenerating the entire network. 


### ***file structure:***

When initialized, a ChainspaceNetwork file will be produced in the C:\ directory, within it you will see four folders and four files, within each node folder there is the typical data directory as well as the stored node password under 'user_input' and the public key under 'address'. The puppeth file is solely enhanced by the networknamehere.json which is just a copy of the real networknamehere.json in the root folder. This JSON file is the genesis file. In the bnode file, the output.txt file is the enode URL for chain communication. And finally, the root directory has the true genesis file 'networknamehere', the address of the sealing node 'susfile', and your inputed network ID.

On initialization the Geth file included in the gethPoA root directory will be moved to program files (x86), removing the need for dependency installation. Due to this file movement, when initializing the network you must run the InitExecution batch file as administrator, otherwise the first printed line in the console will be 'Accsess Denied'. 


### ***Advanced:***

As stated earlier, no Ether is initially allocated to either of the two nodes, to allocate test funds to either of the accounts, you can manually edit the genesis configuration as follows: 

  1. First, close all running scripts, then in the main Chainspacenetwork folder find the genesis file named, networknamehere.json
  2. In the folder you will find the allocations (alloc) section:
there will be a significant amount of pre-funded dev accounts
to add funds to your node add this within the allocation list :
```
 "Your Address here": {
      "balance": "0xEther Amount Here"
    },
```
  4. you can find your address in the text file labeled 'address' in the nodes folder you wish to fund (spare the boot node)
  5. when starting up the network run the BOOTNODE batch file instead of the initexecution file, failing to do so will restart your network leading to a COMPLETE LOSS of all network progress, funds, and programs. 
