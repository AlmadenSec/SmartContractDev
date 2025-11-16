// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract getNumbersandWords {
    
    /* 
     * STATE VARIABLES - These are stored permanently on the blockchain
     * "public" automatically creates a getter function for each variable
     * This means you can read these values without writing additional functions
     */
    
    // Stores a whole number (unsigned integer with 256 bits)
    // Initial value is 24, but it can be changed later
    uint256 public number = 24;
    
    // Stores text data on the blockchain
    // Initial value is "fee fi fo fum", but it can be changed later
    string public words = "fee fi fo fum";
    
    /*
     * READ FUNCTION - Gets the current number value
     * - "view" means this only reads data (no changes to blockchain)
     * - "returns (uint256)" tells us we get back a number
     * 
     * NOTE: This function is optional since "public" on the state variable already creates a getter
     * KEY CONCEPT: Reading is FREE - no gas fees for view functions
     */
    function getnumber() public view returns (uint256) {
        return number;
    }
    
    /*
     * READ FUNCTION - Gets the current text value
     * - "memory" is required when returning strings (temporary storage location)
     * - Like getnumber(), this is optional due to the public state variable
     * 
     * KEY CONCEPT: Both this function AND the auto-generated "words()" function do the same thing
     */
    function getword() public view returns (string memory) {
        return words;
    }
    
    /*
     * WRITE FUNCTION - Changes the stored number to a new value
     * - "_number" is the new value we want to store (underscore prevents name confusion)
     * - This overwrites the old number permanently on the blockchain
     * 
     * KEY CONCEPT: This function COSTS GAS because it changes blockchain data
     * Every update is a transaction that requires payment
     */
    function modifynumber(uint256 _number) public {
        number = _number;  // Replace old number with new number
    }
    
    /*
     * WRITE FUNCTION - Changes the stored text to new text
     * - "_words" is the new text we want to store
     * - "memory" tells Solidity to temporarily store the input during function execution
     * 
     * KEY CONCEPT: Updating strings can be more expensive than numbers
     * Longer text = more storage = higher gas fees
     */
    function modifywords(string memory _words) public {
        words = _words;  // Replace old text with new text
    }
}
