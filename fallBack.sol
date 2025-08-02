// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {
    // Fallback function to handle plain Ether transfers
    fallback() external payable {
        // Logic to execute when the contract receives Ether
    }

    // Receive function to handle direct Ether transfers
    receive() external payable {
        // Logic to execute when the contract receives Ether directly
    }

    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}