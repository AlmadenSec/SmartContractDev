//SPDX-License-Identifier: MIT
pragma solidity^0.8.30;

// This contract demonstrates how to work with arrays in Solidity
// Arrays let us store multiple values of the same type in a single variable
contract simpleArray {

    // STATE VARIABLE: This array is stored permanently on the blockchain
    // uint256[] means "an array that holds unsigned integers"
    // The [] brackets indicate this is a dynamic array (can grow/shrink)
    // We initialize it with three values representing years
    // NOTE: Storing data on-chain costs gas, so every element added costs money
    uint256[] mylist = [1956, 1997, 2004];

    // This function reads and returns the FIRST element from our array
    // public = anyone can call this function
    // view = this function only READS data, doesn't modify anything
    //        Reading is FREE - no gas cost!
    // returns (uint256) = tells Solidity this function gives back a uint256 number
    function showYears0() public view returns (uint256){
        // Array indexing starts at 0 in Solidity (like most programming languages)
        // mylist[0] accesses the first element = 1956
        // mylist[1] would be 1997, mylist[2] would be 2004
        return mylist[0];
    } 

}
