// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Simple {

  int var1; //private
  int public var2; // public
  bool b1; //private
  bool public b2 = true; //public
  address public Owner;
  uint t1 = 20 seconds;
  uint t2 = 30000; // millisec
  uint amount = 15 ether; //15 * 10^18 เก็บเงินในรูปแบบ uint
  uint starttime;
  constructor()  {
    starttime = block.timestamp;
    Owner = msg.sender;
  }

  function getValue() public view returns (int) { // local call
    return var1;
  }

  function setValue(int newVal1,int newVal2) public { // transaction call
   var1 = newVal1;
   var2 = newVal2; 
  }

  function getMultiValue() public view returns(address,uint) {
    return (Owner,t1);
  }
  // function buy () public payable {} 
  // {
  //   msg.value < 5 ether
  //   msg.sender;
  // }
}
