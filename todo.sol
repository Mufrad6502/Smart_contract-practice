// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList{
    struct Todo {
        string task;
        bool completed;
    }

    mapping(uint256 => Todo) public todos;
    uint256 public todoCount;

    // Function to add a new todo
    function addTodo(string memory _task) public {
        todos[todoCount] = Todo(_task, false);
        todoCount++;
    }

    // Function to get a todo by its ID
    function getTodo(uint256 _id) public view returns (string memory, bool) {
        Todo memory todo = todos[_id];
        return (todo.task, todo.completed);
    }

    // Function to mark a todo as completed
    function completeTodo(uint256 _id) public {
        require(_id < todoCount, "Todo does not exist");
        todos[_id].completed = true;
    }

    // Function to test the todo functionality
    function test() public {
        addTodo("Learn Solidity");
        addTodo("Build a DApp");

        (string memory task1, bool completed1) = getTodo(0);
        require(keccak256(abi.encodePacked(task1)) == keccak256(abi.encodePacked("Learn Solidity")), "Task should be 'Learn Solidity'");
        require(completed1 == false, "Task should not be completed");

        completeTodo(0);
        (task1, completed1) = getTodo(0);
        require(completed1 == true, "Task should be completed now");
        
        (string memory task2, bool completed2) = getTodo(1);
        require(keccak256(abi.encodePacked(task2)) == keccak256(abi.encodePacked("Build a DApp")), "Task should be 'Build a DApp'");
        require(completed2 == false, "Second task should not be completed");
    }
}