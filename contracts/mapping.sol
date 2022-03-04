pragma solidity ^0.8;

contract SimpleMapping {
    mapping (uint => bool) public myMapping;
    mapping (address => bool) public addressMapping;
    mapping (uint => mapping (uint => bool)) uintUintBoolMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function resetValue(uint _index) public {
        myMapping[_index] = false;
    }

    function setAddressValue() public {
        addressMapping[msg.sender] = true;
    }

    function setUintUintBool(uint _idx1, uint _idx2) public {
        uintUintBoolMapping[_idx1][_idx2] = true;
    }

    function resetUintUintBool(uint _idx1, uint _idx2) public {
        uintUintBoolMapping[_idx1][_idx2] = false;
    }

    function getUintUintBool(uint _idx1, uint _idx2) public view returns (bool) {
        return uintUintBoolMapping[_idx1][_idx2];
    }
}