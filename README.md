# Lottery Smart Contract ![image](https://github.com/RoySchor/Lottery-Smart-Contract/blob/master/smart-contract.gif)

A lottery system written in JavaScript and Solidity, tested on Remix and on a personal etherereum Blockchain Ganache using Mocha. Then deployed to the Rinkbey Test Network.

### Lottery Application Walk-through:
1) Smart Contract is deployed
   -  An account on the ethereum blockchain deploys this smart contract and, thus, becomes the **Manager** of their own lottery.
2) Users, an Account, enters the Lottery
   - Any account can submit an entry with a minimum etherium buy-in > 0.01 ether 
     - the buy-in ether --> goes into the lottery pot
   - That account now has one share in the lottery
3) The manager, account that deployed the contract, can decide to end the lottery by calling the **pickWinner()** function whenever they decide
   - When pickWinner() is called a random account within the pot is selected
   - Winning account gets the entire lottery pot
   - Lottery is the reset meaning:
      - All accounts are removed, pot is checked to be empty, manager remains same
