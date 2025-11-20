//SPDX-License-Identifier: MIT
pragma solidity^0.8.30;

// This contract demonstrates STRUCTS - custom data types that group related information
// Think of structs like a form or profile card that holds multiple pieces of info about one thing
contract simpleStruct {

    // DEFINING A STRUCT: This creates a new custom data type called "Institutions"
    // A struct is like a template - it defines what fields each institution will have
    // This doesn't create any actual data yet, just describes the structure
    struct Institutions {
        string name;           // The institution's name (e.g., "Fidelity")
        bool isInvestor;       // True/false flag: is this entity an active crypto investor?
        string ethAddress;     // Their Ethereum wallet address (stored as text for this example)
    }

    // CREATING STRUCT INSTANCES: Now we use our template to create actual institution records
    // Each line below creates a new "Institutions" object with specific values
    
    // public = automatically creates a getter function so anyone can read this data for FREE
    // We're filling in the struct fields in order: (name, isInvestor, ethAddress)
    Institutions public BankA = Institutions('Fidelity', true, 'zeroxFidelityDigitalAssets');
    
    // Bank of America isn't flagged as an investor (false) in this example
    Institutions public BankB = Institutions('Bank of America', false, 'zeroxBOA');
    
    // Citi is marked as an investor (true)
    Institutions public BankC = Institutions('Citi', true, 'zeroxCITIInvestments');

    // CURRENT LIMITATION: These three institutions are hardcoded (fixed in the contract code)
    // FUTURE ENHANCEMENT: We want to create a function that lets us add new institutions
    // dynamically and store them in an array, so we can have unlimited institutions
    // without redeploying the contract
}
