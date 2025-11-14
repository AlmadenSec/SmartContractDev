//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30; // stating version

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    // boolean = True, False
    // uint = unsigned integer, positive, whole number (no decimals)
    // int = can be positive or negative
    // address = wallet address
    // bytes = number of bytes, 
    // FavoriteNumber gets initialized to 0 if no number is given
    uint256 public favoriteNumber = 11; // note - by adding in the 'public' qualifier, we are able to see the value of the favoriteNumber datatype 
  
    // functions or methods are small subsections that do a specific thing
    

        // in this function, we want to update our FavoriteNumber variable
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        // in this function we are saying that we want to update the favoriteNumber variable with a new number
        // the _favoriteNumber variable is also a uint256 data type, the same as our original number 
        
    }

        // in this function, we want to view the value of the favoriteNumber variable
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // a function called view/pure only reads - makes no state change - meaning there is no transaction - no gas spend

    // in our two functions, retrieve is only a call to get the value of the favoriteNumber variable - because it is view, there is no gas fee
    // our store function, however, is an update to our favoriteNumber variable, which creates a state change on the blockchain, and incurs a gas fee
}
