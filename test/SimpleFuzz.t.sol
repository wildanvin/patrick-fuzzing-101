// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {SimpleFuzz} from "../src/SimpleFuzz.sol";

contract SimpleFuzzTest is Test {
    SimpleFuzz public simpleFuzz;

    function setUp() public {
        simpleFuzz = new SimpleFuzz();
        //counter.setNumber(0);
    }

    function testSimpleDoStuff() public {
        simpleFuzz.doStuff(12);
        assertEq(simpleFuzz.shouldAlwaysBeZero(), 0);
    }

    function testFuzzDoStuff(uint256 x) public {
        simpleFuzz.doStuff(x);
        assertEq(simpleFuzz.shouldAlwaysBeZero(), 0);
    }
}
