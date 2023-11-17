const SimpleMath = artifacts.require("SimpleMath");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("SimpleMath", function (/* accounts */) {
  it("should assert true", async function () {
    await SimpleMath.deployed(); // await เป็นคำสั่งให้รอทำให้เสร็จก่อนถึงจะทำอันต่อไปได้ จะใส่ await ได้ ต้องมี async ครอบ
    return assert.isTrue(true); // assert คือ สมมุติฐานว่าเงื่อนไขที่ตั้งทำงานถูก เพื่อเป็นการตรวจสอบ
  });
  it("should return max value", async function () {
    const sm = await SimpleMath.deployed(); 
    const a = 1;
    const b = 2;
    const max = await sm.max.call(a,b);
    assert.isTrue(max == b, "This function Max returns incorect result");
  });
  it("should return Average value", async function () {
    const smA = await SimpleMath.deployed(); 
    const a = 10;
    const b = 20;
    const c = 30;
    const average = await smA.average.call(a,b,c);
    assert.isTrue(average == (a + b + c) / 3,"The function Average returns incorrect result");
  });
});
