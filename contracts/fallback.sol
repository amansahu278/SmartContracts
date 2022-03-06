pragma solidity ^0.8;

contract FallBack {

    mapping (address => uint) public paymentBalance;

    address payable owner;

    constructor () {
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        // Pure functions donot interact with the state
        // Pure functions can only call other pure functions
        return _amountInWei /  1 ether;
    }

    function destroySmartContract() public {
        require(msg.sender == owner, "Not authorized!");
        selfdestruct(owner);
    }

    function sendMoney() public payable {
        paymentBalance[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(paymentBalance[msg.sender] >= _amount, "Insufficient Funds");
        paymentBalance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function transferFunds(address payable _to, uint _amount) public {
        require(paymentBalance[_to] >= _amount);
        paymentBalance[_to] -= _amount;
        _to.transfer(_amount);
    }

    receive() external payable {
        sendMoney();
    }

    fallback() external {

    }
}