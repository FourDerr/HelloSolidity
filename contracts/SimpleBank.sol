// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleBank {

  struct Record{
    string Name;
    uint Balance;
  }

  mapping (address => Record ) Balance;

  address public Owner;

  constructor() {
    Owner = msg.sender;
  }

  function Deposit() payable external {
    
  }
}
