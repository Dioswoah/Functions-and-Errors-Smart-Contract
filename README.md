# Simple Guessing Game

This Solidity program is a simple guessing game that demonstrates the use of `require()`, `assert()`, and `revert()` statements in the Solidity programming language. The purpose of this program is to provide a hands-on example of how to handle errors and manage game logic in a Solidity contract.

## Description

This program is a smart contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract allows a game master to set a secret number and players to guess the number. If a player guesses correctly, the game ends. The contract uses `require()`, `assert()`, and `revert()` statements to ensure proper game flow and error handling.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at [https://remix.ethereum.org/](https://remix.ethereum.org/).

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., CustomGuessingGame.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomGuessingGame {
    uint256 private hiddenNumber;
    address public gameMaster;
    bool public isGameActive;

    event GameInitialized(uint256 hiddenNumber);
    event GameFinished(address winner, uint256 guessedNumber);
    event GameRestarted();

    modifier onlyGameMaster() {
        require(msg.sender == gameMaster, "Only the game master can perform this action");
        _;
    }

    constructor() {
        gameMaster = msg.sender;
        isGameActive = false;
    }

    // Function to initialize the game with a hidden number
    function initializeGame(uint256 _hiddenNumber) public onlyGameMaster {
        require(!isGameActive, "Game is already active");
        hiddenNumber = _hiddenNumber;
        isGameActive = true;
        emit GameInitialized(hiddenNumber);
    }

    // Function to guess the number
    function makeGuess(uint256 _guess) public {
        require(isGameActive, "Game is not active");
        if (_guess == hiddenNumber) {
            isGameActive = false;
            emit GameFinished(msg.sender, _guess);
        } else {
            revert("Incorrect guess, try again");
        }
    }

    // Function to restart the game
    function restartGame() public onlyGameMaster {
        assert(isGameActive == false);
        emit GameRestarted();
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile CustomGuessingGame.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "CustomGuessingGame" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the `initializeGame`, `makeGuess`, and `restartGame` functions. Click on the "CustomGuessingGame" contract in the left-hand sidebar, and then click on the appropriate function. Provide the necessary inputs and click on the "transact" button to execute the function.

## Authors
Marc Joshua Ramos

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
