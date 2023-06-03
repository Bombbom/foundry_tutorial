// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Hello.sol";

contract HelloTest is Test {
    HelloWorld public helloWorld;

    function setUp() public {
        helloWorld = new HelloWorld();
        
    }

    function testGreet() public {
        assertEq(helloWorld.greet(),"Hello World!");
    }
}
