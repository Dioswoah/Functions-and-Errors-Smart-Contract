// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ValueManager {
    uint256 public storedValue;
    address public owner;

    // Constructor to initialize the stored value and set the owner
    constructor(uint256 _initialValue) {
        storedValue = _initialValue;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function to set a new stored value
    function updateValue(uint256 _newValue) public onlyOwner {
        require(_newValue > 0, "New value must be greater than zero");
        storedValue = _newValue;
    }

    // Function to increase the stored value and use assert()
    function increaseValue(uint256 _amount) public onlyOwner {
        uint256 previousValue = storedValue;
        storedValue += _amount;
        assert(storedValue > previousValue);
    }

    // Function to decrease the stored value and use revert()
    function decreaseValue(uint256 _amount) public onlyOwner {
        require(storedValue >= _amount, "Insufficient value to decrease");
        storedValue -= _amount;
    }

    // Function to reset the stored value and use revert()
    function resetStoredValue() public onlyOwner {
        if (storedValue == 0) {
            revert("Value is already zero");
        }
        storedValue = 0;
        revert("The value is reset to zero");
    }

    // Function to check the stored value status
    function checkStoredValue() public view returns (uint256) {
        return storedValue;
    }
}
