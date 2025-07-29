// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayShift {
    uint256[] public arr;
    // Function to remove an element from an array by shifting elements
    function arrayRemove( uint256 index) public {
        require(index < arr.length, "Index out of bounds");
        
        // Shift elements to the left
        for (uint256 i = index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        
        // Remove the last element
        arr.pop();
    }
    // Function to add an element to the array
    function test()public {
        arr = [1, 2, 3, 4, 5];
        arrayRemove(1);
        // Check if its working
        require(arr.length == 4, "Length should be 4 after removal");
        require(arr[0] == 1, "First element should be 1");
        require(arr[1] == 3, "Second element should be 3");
        require(arr[2] == 4, "Third element should be 4");
        require(arr[3] == 5, "Fourth element should be 5");
        // The element at index 1 (which was 2) should be removed
        require(arr[1] != 2, "Element at index 1 should not be");
    }
}
