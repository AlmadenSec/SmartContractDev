// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/**
 * @title simpleStruct3
 * @notice Demonstrates combining structs with dynamic arrays for flexible data storage
 * @dev This pattern is foundational for building registries, user lists, and any
 *      collection of structured records in smart contracts
 */
contract simpleStruct3 {

    /**
     * @notice Custom data type defining what information we store about each person
     * @dev Structs are like blueprints - they define the shape of data but don't
     *      store anything themselves until we create instances of them
     * 
     * Memory layout considerations:
     * - string types are dynamically sized (stored as references)
     * - uint256 is a fixed 32-byte value
     * - Order of fields can affect gas costs in some cases, but for structs
     *   stored in arrays, the compiler handles packing
     */
    struct Person {
        string name;        // Dynamic length - can be any text
        uint256 age;        // Fixed size - 32 bytes, holds numbers up to ~10^77
        string location;    // Dynamic length - city, country, etc.
    }

    /**
     * @notice Dynamic array that stores all Person records
     * @dev Key concepts about this declaration:
     * 
     *      Person[] - The square brackets with nothing inside mean "dynamic array"
     *                 This array can grow indefinitely (limited only by gas costs)
     *      
     *      public   - Solidity auto-generates a getter function, but for arrays
     *                 it only lets you access ONE element at a time by index:
     *                 myfriends(0) returns the first person
     *                 myfriends(1) returns the second person
     *                 (There's no built-in way to get the whole array at once)
     *      
     *      Storage  - As a state variable, this lives in permanent blockchain storage
     *                 Every Person we add persists forever (unless we remove it)
     */
    Person[] public myfriends;

    /**
     * @notice Adds a new person to our friends list
     * @param _name The person's name (any string)
     * @param _age The person's age (whole number)
     * @param _location Where the person lives
     * 
     * @dev Breaking down what happens when this function runs:
     * 
     *      1. PARAMETERS & MEMORY
     *         - _name and _location use "memory" keyword because strings are
     *           reference types that need explicit data location
     *         - uint256 doesn't need "memory" because it's a value type that
     *           fits in a single slot and is copied automatically
     *      
     *      2. THE PUSH OPERATION
     *         - .push() is a built-in method for dynamic arrays
     *         - It increases the array length by 1 and adds the new element at the end
     *         - Person(_name, _age, _location) creates a new Person struct instance
     *           using positional arguments (must match the order defined in struct)
     *      
     *      3. GAS COSTS
     *         - This function WRITES to storage, so it costs gas
     *         - First push is most expensive (initializing the array slot)
     *         - Subsequent pushes are cheaper but still cost gas for:
     *           * Increasing array length
     *           * Storing the new struct data
     *         - Longer strings = more gas (more bytes to store)
     * 
     *      4. NO RETURN VALUE
     *         - We could return the new array index if needed:
     *           return myfriends.length - 1;
     */
    function addFriend(string memory _name, uint256 _age, string memory _location) public {
        myfriends.push(Person(_name, _age, _location));
    }

    /*
     * =========================================================================
     * CONCEPTS TO EXPLORE NEXT
     * =========================================================================
     * 
     * Common additions to this pattern:
     * 
     * 1. GET TOTAL COUNT
     *    function getFriendCount() public view returns (uint256) {
     *        return myfriends.length;
     *    }
     * 
     * 2. GET ALL FRIENDS (use with caution - expensive for large arrays)
     *    function getAllFriends() public view returns (Person[] memory) {
     *        return myfriends;
     *    }
     * 
     * 3. UPDATE A FRIEND
     *    function updateFriend(uint256 index, string memory _name, ...) public {
     *        myfriends[index].name = _name;
     *        // etc.
     *    }
     * 
     * 4. REMOVE A FRIEND (tricky - leaves gap or requires reordering)
     * 
     * 5. ACCESS CONTROL (who can add friends?)
     * =========================================================================
     */
}
