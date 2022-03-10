pragma solidity ^0.8;

contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized!");
        _; // The body of the function adding the modifier onlyOwner, will be replaced in the "_"
    }
}