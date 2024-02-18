// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {SimpleFuzz} from "../src/SimpleFuzz.sol";

contract SimpleFuzzTest is StdInvariant, Test {
    SimpleFuzz public simpleFuzz;

    function setUp() public {
        simpleFuzz = new SimpleFuzz();
        targetContract(address(simpleFuzz));
    }

    function testSimpleDoStuff() public {
        simpleFuzz.doStuff(12);
        assertEq(simpleFuzz.shouldAlwaysBeZero(), 0);
    }

    function testFuzzDoStuff(uint256 x) public {
        simpleFuzz.doStuff(x);
        assertEq(simpleFuzz.shouldAlwaysBeZero(), 0);
    }

    //This is to make invariant aka statefull fuzzing:
    function invariant_testAlwaysReturnsZero () public {
        assertEq(simpleFuzz.shouldAlwaysBeZero(), 0);
    }
}
