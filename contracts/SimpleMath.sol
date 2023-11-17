// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleMath {
  
 function max(uint a , uint b) public pure returns (uint){
  uint result;
  if(a > b)
  {
    result =a;
  }
  else{
    result = b;
  }
  return result;
 }

 function average(uint a, uint b, uint c) public pure returns (uint){
  uint Average;
  Average = (a + b + c) / 3;
  return Average;
 }
}
