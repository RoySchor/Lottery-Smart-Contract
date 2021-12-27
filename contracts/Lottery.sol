pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;

    function Lottery() public {
        //Using the globally provided msg object by solidity retrieves sender's account address
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
    }

    //Not exactly random as this is open source and can be manipulated if someone calls
    //pickWinner at the right time knowing the difficulty and players
    function random() private view returns (uint) {
        return uint(sha3(block.difficulty, now, players));
    }

    function pickWinner() public restricted {
        address winner = players[random() % players.length];
        winner.transfer(this.balance);

        //Resets the players array to get ready for a new lottery round without requiring
        //contract redeployment, keeping the manager the same
        players = new address[](0);
    }

    //Checks that only the manager can call a given function
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function getPlayers() public view returns (address[]){
        return players;
    }
}