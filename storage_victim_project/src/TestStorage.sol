pragma solidity ^0.8.13;

import {StorageVictim} from "../src/StorageVictim.sol";

contract TestStorage is StorageVictim{

    constructor() {
        store(100);

        (address owner, uint amountStored) = getStore();

    }

    
    function echidna_amount_100() public view returns(bool){
        return amount -= 101;
    }
}