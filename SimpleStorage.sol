// SPDX-License-Identifier: MIT
// MIT License is the least restrictive
pragma solidity ^0.8.7; // Any version of 0.8.7 and above will work

contract SimpleStorage {
    // Similar to a class in java or Js

    uint256 favoriteNumber; // Initialized to zero

    mapping(string => uint256) public nameToFavoriteNumber;

    /* People public person = People({favoriteNumber: 69, name: "Deez"});

    People public person2 = People({favoriteNumber: 9, name: "Dee"});

    By doing this, we would have to rewrite the whole line everytime for every other person
    which is not feasible.

    So we will use an array
    */

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public persons; // array is currently empty

    // and this array is a dynamic array
    // (because size is not given)

    function store(uint256 _favoriteNumber) public virtual {
        // virtual for override
        favoriteNumber = _favoriteNumber;
        // retrieve(); // view or pure functions when called by a gas calling function will cost gas
    }

    //transaction cost
    // 43746 -- without view
    // 43886 -- with retrieve

    // bool hasFavoriteNumber = true;
    // uint256 favoriteNumber = 5;
    // string favoriteNumberInText = "Five";
    // int256 favoriteInt = -5;
    // address myAddress = 0x70513640cFF9086c121B93D1666e518733f68f8e;
    // bytes32 favoriteBytes = "dog"; // 0x62878932y8923 (random)
    // // Maximum size is bytes32 (32 * 8 = 256 bits)

    // returning favoriteNumber (resembling public variable implicit function)

    // view and pure functions when called alone don't spend gas

    //view --> read (no modification)
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // pure --> can't even read (no modification)
    function add() public pure returns (uint256) {
        return (1 + 1);
    }

    // EVM can access and store information in six places
    /*
        1. Stack
        2. Memory
        3. Storage
        4. Calldata
        5. Code
        6. Logs
        */

    // calldata, memory, storage
    // calldata, memory means that the variable is going to exist temporarily
    // calldata is used when the variable is not modified in the transaction (can not be modified)
    // storage variables exist even outside of the function executing (permanent)

    // Data location can only be specified for array, struct or mapping types
    // string is a kind of array, so we need to specify 'memory' with it
    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        // persons.push(People(_favoriteNumber, _name));
        // OR

        People memory newPerson = People({
            favoriteNumber: _favoriteNumber,
            name: _name
        });
        persons.push(newPerson); // the first ever addition will be at 0 index
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // this method is not that much efficient, because we need to iterate every index for
    // finding a specific person, so instead of this we will use mappings.

    // A mapping is a data structure where a key is "mapped" to a single value.( sort of a dictionary)
    // a set of keys, which each key returning a certain value associated with that key
}

/* Four Solidity Basic types: boolean, uint, int, address, bytes
boolean defines true false, uint is unsigned integer (whole number
which is not positive or negative, just positive), int is +ve or 
-ve whole number, address is the address like what we saw in metamask
*/ // One byte is equal to 8 bits
// Bit is the smallest unit of data measurement
// It can be 0 or 1

/* uint8 favoriteNumber = 123;
we can specify the bits we want to allocate

uint8 is 8 bits upto uint256 which is 256 bits

If we don't specify the bit it will take
default 256 bits uint256 or int256
*/

// All of this code gets complied to EVM (Ethereum Virtual Machine)
