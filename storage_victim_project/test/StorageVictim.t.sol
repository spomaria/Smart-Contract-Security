// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {StorageVictim} from "../src/StorageVictim.sol";

contract StorageVictimTest is Test {
    StorageVictim public storages;

    // This function deploys an instance of the 'StorageVictim' contract
    // and calls the 'store' function.
    // The address of the caller is saved as 'owner'
    function setUp() public {
        storages = new StorageVictim();
        storages.store(100);
    }

    // This function checks if the 'amount' variable changes whenever 
    // the 'store' function is called
    function test_getStoredAmount() public {
        // retrieve the stored amount by calling the getStore function.
        // the stored amount is saved in a variable called 'amountStored'
        (,uint amountStored) = storages.getStore();
        assertEq(amountStored, 100, "Stored amount should be 100");
    }

    function test_getOwner() public {
        // retrieve the owner by calling the getStore function.
        // the owner is saved in a variable called 'owner'
        (address owner,) = storages.getStore();    
        assertEq(storages.getOwner(), owner, "owner should not change");
    }

    function testFuzz_setStore(uint256 x) public {
        storages.store(x);
        // retrieve the owner and the amountStored by calling the getStore function.
        // the owner is saved in a variable called 'owner'
        // the stored amount is saved in a variable called 'amountStored'
        (address owner, uint amountStored) = storages.getStore();
        // check that the state variable changes as expected
        assertEq(amountStored, x, "stored amount should equal x");
        // check that the owner is the caller of the function
        assertEq(storages.getOwner(), owner, "owner should not change");
    }
}
