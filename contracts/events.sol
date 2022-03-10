pragma solidity ^0.8;

contract Events{
    mapping(address => uint) public tokenBalance;

    event TokensSent(address _from, address _to, uint _amt);


    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address payable _to, uint _amt) public returns(bool){
        require(tokenBalance[msg.sender] >= _amt, "Not sufficient tokens");
        assert(tokenBalance[_to] + _amt >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amt <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amt;
        tokenBalance[_to] += _amt;

        emit TokensSent(msg.sender, _to, _amt);
        return true;
    }

}