// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayShift {
    // Function to remove an element from an array by shifting elements
    function arrayRemove(uint256[] storage arr, uint256 index) internal {
        require(index < arr.length, "Index out of bounds");
        
        // Shift elements to the left
        for (uint256 i = index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        
        // Remove the last element
        arr.pop();
    }
}
