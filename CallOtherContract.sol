// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

interface SendETH {
    function sendETHTransfer(address payable _to, uint256 _amount) external;
}

interface EthReceiver {
    // Define any required functions here if needed, or leave empty if only for receiving ETH
}

contract CallOtherContract {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {
        // Logic to handle incoming Ether
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function callSendETH(address _contractAddress, address payable _to, uint256 _amount) external onlyOwner {
        SendETH sendETHContract = SendETH(_contractAddress);
        sendETHContract.sendETHTransfer(_to, _amount);
    }

    function callEthReceiver(address _receiverAddress) external payable {
        EthReceiver ethReceiver = EthReceiver(_receiverAddress);
        (bool success, ) = address(ethReceiver).call{value: msg.value}("");
        require(success, "Transfer to EthReceiver failed");
    }
}   