// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractVisibility {
    // Public variable, accessible from outside the contract
    uint256 public publicVar;

    // Internal variable, accessible within this contract and derived contracts
    uint256 internal internalVar;

    // Private variable, accessible only within this contract
    uint256 private privateVar;

    // External function, can be called from outside the contract
    function setPublicVar(uint256 _value) public {
        publicVar = _value;
    }

    // Internal function, can be called within this contract or derived contracts
    function setInternalVar(uint256 _value) internal {
        internalVar = _value;
    }

    // Private function, can only be called within this contract
    function setPrivateVar(uint256 _value) private {
        privateVar = _value;
    }

    // Function to demonstrate visibility
    function testVisibility() public {
        setPublicVar(10);
        setInternalVar(20);
        setPrivateVar(30);
        
        require(publicVar == 10, "Public variable should be 10");
        require(internalVar == 20, "Internal variable should be 20");
        require(privateVar == 30, "Private variable should be 30");
    }
}