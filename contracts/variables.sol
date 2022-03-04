pragma solidity ^0.8;

contract Variables{

    uint public myInt;
    uint8 public myInt8;
    bool public myBool;

    function set(uint _myUint) public {
        myInt = _myUint;
    }

    function setBool(bool _newBool) public {
        myBool = _newBool;
    }

    function incrementInt() public {
        myInt8 ++;
    }

    function decrementInt() public {
        unchecked {
            myInt8 --;
        }
    }

    function toggleBool() public {
        myBool = !myBool;
    }
    address public myAddress;

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function getBalance() public view returns(uint) {
        return myAddress.balance;
    }
}