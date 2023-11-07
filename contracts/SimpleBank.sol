// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleBank {
    struct Record {
        string name;
        uint balance;
    }

    // mapping (key => value) name; เก็บมากกว่า 1 ให้ใส่ value เป็น struct
    mapping(address => Record) balances;
    address public owner; // ที่อยู่เจ้าของ
    uint constant DEFALUT_MAX_WITHDRAW_AMOUNT = 2 ether; //default ให้คนถอนเงินได้สูงสุดคือ 2 ether
    uint maxWithdrawAmount;

    //event คือเหตุการณ์ที่เกิดขึ้น โดยถ้าจะทำงานกับแอพ แอพข้างนอกจะมาดู event 
    event Deposited(address depositor, uint amount, uint timestamp);
    event Withdrawn(address withdrawer, uint amount, uint timestamp);
    event ChangeMaxWithDrawLimit(uint amount, uint timestamp); // timestamp ตรวจสอบว่าเหตุการณ์เกิดขึ้นเมื่อไหร่

    constructor() {
        owner = msg.sender;
        maxWithdrawAmount = DEFALUT_MAX_WITHDRAW_AMOUNT;
    }

    modifier onlyOwner { // มี require กี่ตัวก็ได้
        require(msg.sender == owner, "Permision Denind");
        _; // ไวยากรณ์พิเศษที่มีแค่ใน modifier
    }


    function setMaximumLimit(uint amount)  public onlyOwner{
        require(amount > 0 , "Maximum limit can not be zero");
        maxWithdrawAmount = amount;
        //emit คือคำสั่งส่งออกจาก event 
        emit ChangeMaxWithDrawLimit(amount, block.timestamp);
    }

    function deposit(string memory name) external payable {
        require(msg.value > 0, "Zero Balance not allowed");
        Record memory record = balances[msg.sender];

        if (record.balance > 0) {
            // old deposit เคยฝากเงินแล้ว
            record.balance += msg.value;
        } else {
            // first time deposit ฝากเงินครั้งแรก
            record = Record(name, msg.value);
            balances[msg.sender] = record;
        }
        //emit คือคำสั่งส่งออกจาก event 
        emit Deposited(msg.sender, msg.value, block.timestamp); // เทียบกับ event ข้างบน Deposited sender คือ address value คือ uint timestamp คือ uint
    }

    function withdraw(uint amount) external {
        require(amount <= maxWithdrawAmount, "Exceed maximum withdraw limit");
        require(amount <= balances[msg.sender].balance, "Insufficient balance"); // การใช้ require สามารถใช้ได้หลายครั้ง
        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender,amount,block.timestamp);
    }

    function getBalance() external view returns (uint) {
        return balances[msg.sender].balance; //balance คือ table
    }
}
