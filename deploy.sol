// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import or define ArrayShift contract
contract ArrayShift {
    // Add contract logic or leave empty if not needed for deployment
}

// Import or define StructTest contract
contract StructTest {
    // Add contract logic or leave empty if not needed for deployment
}

// Import or define MappingTest contract
contract MappingTest {
    // Add contract logic or leave empty if not needed for deployment
}

contract Deploy {
    // Function to deploy the ArrayShift contract
    function deployArrayShift() public returns (address) {
        ArrayShift arrayShift = new ArrayShift();
        return address(arrayShift);
    }

    // Function to deploy the StructTest contract
    function deployStructTest() public returns (address) {
        StructTest structTest = new StructTest();
        return address(structTest);
    }

    // Function to deploy the MappingTest contract
    function deployMappingTest() public returns (address) {
        MappingTest mappingTest = new MappingTest();
        return address(mappingTest);
    }
}