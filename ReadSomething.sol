// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ReadSomething {
    
    // State variable: A string that stores text permanently on the blockchain
    // Strings are used for storing text data (words, sentences, etc.)
    // This sentence will be stored until someone changes it
    string sentence = "Take me to the ball-game";
    
    /* 
     * READ FUNCTION - Gets the current sentence without changing it
     * - "public" means anyone can call this function
     * - "view" means this function only reads data (no blockchain changes)
     * - "returns (string memory)" tells us this function gives back text
     * - "memory" is required for strings - it means temporary storage during function execution
     * 
     * KEY CONCEPT: Reading data is FREE (no gas fees) because nothing changes on the blockchain
     */
    function retrieve() public view returns (string memory) {
        return sentence;
    }
    
    /*
     * WRITE FUNCTION - Updates the sentence with new text
     * - Takes a string parameter called "_sentence" (the underscore helps distinguish it from our state variable)
     * - "memory" keyword means the input string is temporarily stored during function execution
     * - This function changes the state variable "sentence" to whatever text you provide
     * 
     * KEY CONCEPT: Changing data COSTS GAS because you're updating the blockchain
     * Every time someone calls this function, they pay a transaction fee
     */
    function modifySentence(string memory _sentence) public {
        sentence = _sentence;  // Replace the old sentence with the new one
    }
}
