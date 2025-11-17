// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

// Contract: simpleBool
// Purpose: Demonstrates how to store and retrieve boolean (true/false) values on the blockchain
// 
// Key Learning Points:
// - Booleans are one of the simplest data types in Solidity
// - They can only hold two values: true or false
// - Useful for tracking states, conditions, or flags in your smart contracts
contract simpleBool {
    
    // State Variable: isTired
    // Type: bool (boolean)
    // Visibility: private (by default, since no visibility is specified)
    // Initial Value: true
    //
    // What this does:
    // - Stores a true/false value permanently on the blockchain
    // - Writing (changing) this value costs gas (blockchain transaction fee)
    // - Reading this value through a function is free (no gas cost)
    //
    // Real-world use cases for booleans:
    // - isActive (checking if something is turned on/off)
    // - hasVoted (tracking if an address has already voted)
    // - isPaused (emergency stops for contracts)
    // - isOwner (checking permissions)
    bool isTired = true;

    // Function: getStatus
    // Purpose: Allows anyone to check the current value of isTired
    // 
    // Function breakdown:
    // - "public" means anyone can call this function
    // - "view" means this function only READS data (doesn't change anything)
    // - "returns (bool)" tells us this function gives back a true/false value
    //
    // Why we need this function:
    // - The isTired variable is private by default
    // - External users/contracts can't see private variables directly
    // - This function acts as a "window" to let others see the value
    //
    // Gas cost: FREE to call (because it's a view function)
    function getStatus() public view returns (bool) {
        return isTired; 
    }

    // What's missing from this contract?
    // In a real-world scenario, you'd typically also want:
    // 
    // 1. A function to CHANGE the boolean value:
    //    function setStatus(bool _newStatus) public {
    //        isTired = _newStatus;  // This would cost gas!
    //    }
    //
    // 2. Or a function to toggle (flip) the boolean:
    //    function toggleStatus() public {
    //        isTired = !isTired;  // Flips true to false, or false to true
    //    }
    //
    // Note: If you make isTired "public" instead of private:
    // - Solidity automatically creates a getter function
    // - You wouldn't need getStatus() at all
    // - Example: bool public isTired = true;
}
