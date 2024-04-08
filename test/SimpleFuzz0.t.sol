// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {SimpleFuzz} from "../src/SimpleFuzz.sol";

import {console} from "forge-std/console.sol";

contract SimpleFuzzTest is Test {
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
        console.log("Testing");
        assertEq(simpleFuzz.shouldAlwaysBeZero(), 0);
    }
}

contract EchidnaTest is SimpleFuzz {

    function echidna_fuzzing () public pure returns (bool) {
        return true;
    }

    function echidna_invariant () public view returns (bool) {
        return (shouldAlwaysBeZero == 0);
    }

}