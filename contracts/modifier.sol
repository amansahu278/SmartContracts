pragma solidity ^0.8;

contract InheritanceandModifiers{

    mapping(address => uint) public tokenBalance;

    address owner;

    uint tokenPrice = 1 ether;

    constructor() {
        owner = msg.sender;
        tokenBalance[owner] = 100;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized!");
        _; // The body of the function adding the modifier onlyOwner, will be replaced in the "_"
    }

    function createNewToken() public onlyOwner{
        tokenBalance[owner] ++;
    }

    function burnToken() public onlyOwner {
        tokenBalance[owner] --;
    }

    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "Not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address payable _to, uint _amt) public {
        require(tokenBalance[msg.sender] >= _amt, "Not sufficient tokens");
        assert(tokenBalance[_to] + _amt >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amt <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amt;
        tokenBalance[_to] += _amt;

    }

}