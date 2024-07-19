// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint256 public value;

    constructor(uint256 initialValue) {
        value = initialValue;
    }

    function setValue(uint256 newValue) public {
        require(newValue > 0, "Value must be greater than 0");
        value = newValue;
    }

    function checkValue(uint256 expectedValue) public view {
        assert(value == expectedValue);
    }

    function resetValue() public {
        if (value != 0) {
            revert("Value is not zero");
        }
        value = 0;
    }
}

