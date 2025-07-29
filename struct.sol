// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructTest {
    struct Person {
        string name;
        uint256 age;
    }

    mapping(address => Person) public people;

    // Function to set a person's details
    function setPerson(address _addr, string memory _name, uint256 _age) public {
        people[_addr] = Person(_name, _age);
    }

    // Function to get a person's details
    function getPerson(address _addr) public view returns (string memory, uint256) {
        Person memory person = people[_addr];
        return (person.name, person.age);
    }

    // Function to test the struct functionality
    function test() public {
        address addr1 = 0x1234567890123456789012345678901234567890;
        setPerson(addr1, "Alice", 30);
        
        (string memory name, uint256 age) = getPerson(addr1);
        
        require(keccak256(abi.encodePacked(name)) == keccak256(abi.encodePacked("Alice")), "Name should be Alice");
        require(age == 30, "Age should be 30");
        
        // Check if the person is set correctly
        require(keccak256(abi.encodePacked(people[addr1].name)) != keccak256(abi.encodePacked("")), "Name should not be empty");
        require(people[addr1].age != 0, "Age should not be zero");
    }
}