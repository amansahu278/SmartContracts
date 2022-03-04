pragma solidity ^0.8;

contract SendRecMoney {
    uint public balanceRecieved;
    uint public lockedUntil;
    address public creator;
    bool paused;

    constructor() {
        creator = msg.sender;
    }

    function setPaused(bool _paused) public {
        require(creator == msg.sender, "Not authorized");
        paused = _paused;
    }

    function recieve() public payable {
        balanceRecieved = msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }

    function getBalance() public view returns(uint){
        require(paused == false, "Contract is paused");
        return address(this).balance;
    }

    function withdraw() public {
        require(creator == msg.sender, "Not authorized");
        require(paused == false, "Contract is paused");
        if(lockedUntil < block.timestamp){
            address payable to = payable(msg.sender); // The one who calls the contract
            to.transfer(this.getBalance());
        }
    }

    function withdrawTo(address _address) public {
        require(creator == _address, "Not authorized");
        require(paused == false, "Contract is paused");
        if(lockedUntil < block.timestamp){
            address payable to = payable(_address);
            to.transfer(this.getBalance());
        }
    }
}