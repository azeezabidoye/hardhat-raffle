// Raffle contract

// TO DO:
// Enter the lottery (by paying some amounts)
// Pick a random winner programmatically (verifiably random)
// Winner to be selected every X-minutes -- completely automated
//
// ChainLink Oracle :
// Randomeness -- Chainlink Random Number
// Automated Execution -- Chainlink keepers

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Error Codes
error Raffle__NotEnoughETHEntered();

contract Raffle {
    /* State Variables */

    // An Immutable private variable to specify the entry-amount for the raffle
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    /* Events */
    event RaffleEnter(address player);

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        // Condition for the Entrance fee amount
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughETHEntered();
        }

        // Add player to the array of players with enranceFee
        s_players.push(payable(msg.sender));

        // Event for logging new player after paying entranceFee
        emit RaffleEnter(msg.sender);
    }

    // function pickRandomWinner() {

    // }

    // Getter function for entranceFee
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    // Getter function for players
    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
