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
