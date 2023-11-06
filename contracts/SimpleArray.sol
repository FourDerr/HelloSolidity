// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleArray {
  function average (uint[] memory arr ) public pure returns (uint){
    uint sum = 0;
    for (uint i =0; i < arr.length; i++)
    {
      sum  += arr[i];
    }
    return sum / arr.length;
  }
}
