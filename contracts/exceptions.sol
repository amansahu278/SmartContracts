pragma solidity ^0.8;

contract Exceptions {

    mapping (address => uint64) public accountBalance;

    function sendMoney() public payable {
        // Asserting for overflow, making sure of invariance
        assert(msg.value == uint64(msg.value));
        accountBalance[msg.sender] += uint64(msg.value);
        // Asserting for overflow
        assert(accountBalance[msg.sender] >= uint64(msg.value));   
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(accountBalance[_to] >= _amount, "Insufficient balance");
        // Checking for underflow
        assert(accountBalance[msg.sender] >= accountBalance[msg.sender] - _amount);
        accountBalance[_to] -= _amount;
        _to.transfer(_amount);
    }
}