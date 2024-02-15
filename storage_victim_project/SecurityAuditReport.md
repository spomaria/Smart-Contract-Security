# Smart Contract Security Audit Report

This solidity program is a simple exercise aimed at carrying out Smart Contract Audit in order to purge the Smart Contract of inherent vulnerabilities and edge cases that may make it fail. The purpose is to demonstrate how to slither, forge and echidna in Smart Contract Auditing. This is a required project to complete the Smart Contract Security section of the  ETH PROOF: Advanced EVM Course at [@metacraftersio](https://twitter.com/metacraftersio)


This Smart Contract Security Audit began with changing the solidity compiler verision to '0.8.23' being the recent stable version.

We then proceeded to install and use the solidity compiler version on our local machine by using the following codes
```
solc-select install 0.8.18
solc-select use 0.8.18
```

## Slither
In order to check for Smart Contract vulnerabilities, we run the following command
```
slither StorageVictim.sol
```
The following vulnerabilities were exposed
1. A Function was defined using the same name as the contract on line 16 (posible intent was to serve as a constructor). The function name was therefore changed as a corrective measure and the keyword 'constructor' is used instead. The 'function' keyword and visibility are omitted.

2. The 'str' variable (line 25) was not assigned a data location. Slither suggests the use of "storage", "memory" or "calldata" keyword to silence this warning. Line 25 modified to read `Storage memory str = Storage({user: msg.sender, amount: _amount});`.

3. StorageVictim.owner (StorageVictim.sol#6) should be immutable. Line 6 modified to read `address immutable owner;`.

4. Parameter StorageVictim.store(uint256)._amount (StorageVictim.sol#21) is not in mixedCase. This warning can be ignored since the variable name consist of a one word.

After resolving all Smart Contract vulnerabilities, we proceed to conduct fuzz tests.

## Foundry
In order to carry out fuzz testing on the StorageVictim.sol contract, we create the 'StorageVictim.t.sol' file and store it in the '/test' folder. We then move to the '/storage_victim_project' directory and run the following command to carry out the fuzz test `forge test`. 
The essence of fuzz testing is to discover vulnerabilities in the Smart Contract or edge cases that may make the program fail.

After carrying out the fuzz test, no issues were observed as all three tests passed.

## Echidna
In order to carry out propert fuzz tests, we use echidna.

## Authors
Nengak Emmanuel Goltong 

[@NengakGoltong](https://twitter.com/nengakgoltong) 
[@nengakgoltong](https://www.linkedin.com/in/nengak-goltong-81009b200)

## License
This project is licensed under the MIT License - see the LICENSE.md file for details