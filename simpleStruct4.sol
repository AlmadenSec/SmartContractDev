// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/*
    CONTRACT OVERVIEW: simpleStruct4
    ================================
    This contract demonstrates how to combine two powerful Solidity concepts:
    structs (custom data types) and dynamic arrays (growable lists).
    
    Together, they let us store collections of complex, multi-field records,
    like a database table that can grow as users add new entries.
    
    Real-world analogy: Think of this as a spreadsheet where each row 
    represents a car (with make and model columns), and users can keep 
    adding new rows indefinitely.
*/

contract simpleStruct4 {

    /*
        STRUCT DEFINITION: Cars
        -----------------------
        A struct is a custom data type that bundles related variables together.
        Here we're creating a "Cars" type that groups two pieces of information
        that naturally belong together: the manufacturer (make) and the 
        specific vehicle name (model).
        
        This is just a BLUEPRINT or TEMPLATE at this point. We haven't created
        any actual car data yet, just defined what a "car record" looks like.
        
        Example data that could fit this struct:
        - make: "Toyota", model: "Camry"
        - make: "Ford", model: "Mustang"
    */
    struct Cars {
        string make;   // The manufacturer (e.g., "Honda", "BMW", "Tesla")
        string model;  // The specific vehicle name (e.g., "Civic", "X5", "Model 3")
    }

    /*
        DYNAMIC ARRAY DECLARATION: favoriteCars
        ---------------------------------------
        This line creates a growable list that can hold multiple Cars structs.
        
        Breaking down the syntax:
        - Cars[]  → The TYPE: "an array of Cars structs" (the empty brackets 
                    mean it's dynamic, so it can grow or shrink)
        - public  → Visibility: anyone can read this data (Solidity auto-generates
                    a getter function so external apps can access individual entries)
        - favoriteCars → The variable NAME we chose for this list
        
        Right now this array is empty (length = 0). It will grow each time 
        someone calls addCars(). Unlike fixed-size arrays, dynamic arrays 
        have no predetermined limit on how many items they can hold.
        
        Storage note: Because this is declared at the contract level (not inside
        a function), it lives in STORAGE, meaning it persists on the blockchain
        permanently and survives between function calls.
    */
    Cars[] public favoriteCars;

    /*
        FUNCTION: addCars
        -----------------
        This function allows anyone to add a new car to our favoriteCars list.
        Each call creates a new Cars struct and appends it to the end of the array.
        
        Parameters explained:
        - _make: The car manufacturer to store (underscore prefix is a common 
                 convention to distinguish function parameters from state variables)
        - _model: The car model name to store
        
        Why "memory" keyword?
        Strings are complex data types in Solidity. When passed into functions,
        we must specify where they temporarily live during execution. "memory"
        means these strings exist only while the function runs, then disappear.
        This is more gas-efficient than storage for temporary data.
        
        How push() works:
        The .push() method is built into dynamic arrays. It does two things:
        1. Increases the array length by 1
        2. Adds the new item at the end (the new last position)
        
        The Cars(_make, _model) part is a "struct constructor" that creates
        a new Cars struct instance with the provided values, which then gets
        pushed into the array.
    */
    function addCars(string memory _make, string memory _model) public {
        favoriteCars.push(Cars(_make, _model));
    }

    /*
        HOW TO USE THIS CONTRACT:
        -------------------------
        1. Deploy the contract (favoriteCars array starts empty)
        
        2. Call addCars("Toyota", "Supra") 
           → favoriteCars now has 1 entry at index 0
        
        3. Call addCars("Porsche", "911")
           → favoriteCars now has 2 entries (indices 0 and 1)
        
        4. Access data via the auto-generated getter:
           → favoriteCars(0) returns ("Toyota", "Supra")
           → favoriteCars(1) returns ("Porsche", "911")
        
        Note: Array indices start at 0, so the first car is at position 0,
        the second at position 1, and so on.
    */
}
