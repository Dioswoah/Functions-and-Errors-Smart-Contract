# Value Manager Smart Contract

This Solidity program demonstrates the use of error handling with `require()`, `assert()`, and `revert()` statements. It provides functionalities to update, increase, decrease, and reset a stored value with appropriate error checking.

## Description

The contract `ValueManager` includes functions to manage a stored value while ensuring proper execution and state management through error handling. It serves as an example for implementing error checks in Solidity smart contracts.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Visit the Remix website at [Remix](https://remix.ethereum.org/).

2. Create a new file by clicking the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `ValueManager.sol`). Copy and paste the following code into the file:

```solidity
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
```
To compile the contract, click on the "Solidity Compiler" tab in the left-hand sidebar. Ensure the compiler version is set to 0.8.18 or a compatible version, then click the "Compile ValueManager.sol" button.

After compiling the code, navigate to the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the ValueManager contract from the dropdown menu and click the "Deploy" button.

The deployed contract will appear in the "Deployed Contracts" section. Here, you can interact with the contract's functions using the provided UI. Test the various functions to observe how the stored value is managed and error handling is executed.


## Authors

Marc Joshua B. Ramos

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
