pragma solidity ^0.8;

contract StructMapping {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping (uint => Payment) payments;
    }

    mapping (address => Balance) public balanceRecieved;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceRecieved[msg.sender].totalBalance += msg.value;

        Payment memory payment = Payment(msg.value, block.timestamp);
        balanceRecieved[msg.sender].payments[balanceRecieved[msg.sender].numPayments] = payment;
        balanceRecieved[msg.sender].numPayments++;
    }

    function withdraw(address payable _to, uint _amount) public {
        require(balanceRecieved[_to].totalBalance >= _amount, "Not enough funds");
        balanceRecieved[_to].totalBalance -= _amount;
        _to.transfer(_amount);
    }

    function withdrawAllMoney(address payable _to) public {

        // Checks-effects-interaction pattern.  You interact with outside addresses last
        uint balanceToSend = balanceRecieved[_to].totalBalance;
        balanceRecieved[_to].totalBalance = 0;
        _to.transfer(balanceToSend);

    }
}