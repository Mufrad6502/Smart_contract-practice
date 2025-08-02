// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {
        event Log(string func, address sender, uint value, bytes data);

    // Fallback function to handle plain Ether transfers
    fallback() external payable {
        // Logic to execute when the contract receives Ether
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    // Receive function to handle direct Ether transfers
    receive() external payable {
        // Logic to execute when the contract receives Ether directly
        emit Log("receive", msg.sender, msg.value, "");
    }

    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}