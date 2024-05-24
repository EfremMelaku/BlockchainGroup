<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
}
>>>>>>> 2834b257ea2ef923bdce34b2f2b55ae6c70276a8
