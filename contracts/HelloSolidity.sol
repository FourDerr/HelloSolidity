// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; // pragma เป็นตัวบอกไวยากรณ์ >= คือใช้ compiler มากว่าหรือเท่ากับ 0.4.22 แต่เวอร์ชันต้องน้อยกว่า 0.9.9 ห้ามเปลี่ยน 

contract HelloSolidity {
  function add(int x, int y)  public pure returns (int) {
    return x + y; 
  }
  function subtract(int x, int y)  public pure returns (int) {
    return x - y; 
  }
  function multiply(int x, int y)  public pure returns (int) {
    return x * y; 
  }
  function divide(int x, int y)  public pure returns (int) {
    return x / y; 
  }
}