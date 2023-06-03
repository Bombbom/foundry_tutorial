// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CounterV2.sol";

contract CounterV2Test is Test{
    CounterV2 public counter;
    function setUp() public {
        counter = new CounterV2();
    }
    function testInc() public {
        uint count_before = counter.count();
        counter.inc();
        assertEq(count_before,counter.count()-1);
    }
    
    function testDec() public {
        uint count_before = counter.count();
        counter.dec();
        assertEq(count_before, counter.count()+1);
    }
    function testFailDec() public {
        counter.dec();
    }

    function testDecUnderflow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.dec();
    }
}