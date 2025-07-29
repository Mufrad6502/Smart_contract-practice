// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract MappingTest{
    mapping(address => uint256) public balances;
    // Function to set balance for an address
    function setBalance(address _addr, uint256 _amount) public {
        balances[_addr] = _amount;
    }
    //check the balance of an address
    function getBalance(address _addr) public view returns (uint256) {
        return balances[_addr];
    }
    // Function to test the mapping functionality
    function test() public {
        address addr1 = 0x1234567890123456789012345678901234567890;
        address addr2 = 0x0987654321098765432109876543210987654321;
        setBalance(addr1, 100);
        setBalance(addr2, 200);
        require(getBalance(addr1) == 100, "Balance of addr1 should be 100");
        require(getBalance(addr2) == 200, "Balance of addr2 should be 200");
        // Check if the balances are set correctly
        require(balances[addr1] != 0, "Balance of addr1 should not be zero");
        require(balances[addr2] != 0, "Balance of addr2 should not be zero");
        // Check if the balances are different
        require(balances[addr1] != balances[addr2], "Balances should be different");

}