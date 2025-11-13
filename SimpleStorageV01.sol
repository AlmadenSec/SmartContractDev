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
    uint256 public favoriteNumber; // note - by adding in the 'public' qualifier, we are able to see the value of the favoriteNumber datatype 
  
    // functions or methods are small subsections that do a specific thing
    // in this function, we want to update our FavoriteNumber variable
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        // in this function we are saying that we want to update the favoriteNumber variable with a new number
        // the _favoriteNumber variable is also a uint256 data type, the same as our original number 
        
    }
}

