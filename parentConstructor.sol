// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract A{
    string public name;
    constructor(string memory _name) {
        name = _name;
    }
}


contract B {
    string public text;
    constructor(string memory _text) {
        text = _text;
    }
}

contract C is A , B{
    constructor(string memory _name, string memory _text) A(_name) B(_text) {
        // Constructor of C initializes both A and B
    }

    function getDetails() public view returns (string memory, string memory) {
        return (name, text);
    }    
}