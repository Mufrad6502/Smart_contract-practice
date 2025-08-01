// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SendETH {
    constructor() payable {}

    receive () external payable {
        // Logic to handle incoming Ether
    }
function sendETHTransfer(address payable _to, uint256 _amount) public {
        require(address(this).balance >= _amount, "Insufficient balance");
        _to.transfer(_amount);
    }


function sendETHCall(address payable _to, uint256 _amount) public {
        require(address(this).balance >= _amount, "Insufficient balance");
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Transfer failed");
    }
}

contract EthReceiver{
    event Log(uint amount , uint gas);
    
    receive() external payable {
        emit Log(msg.value, gasleft());
    }
} 