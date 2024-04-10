//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {RicToken} from "../src/RicToken.sol";
import {DeployRicToken} from "../script/DeployRicToken.s.sol";

contract RicTokenTest is Test {
    RicToken public ricToken;
    DeployRicToken public deployer;

    // Address
    address bob = makeAddr("Bob");
    address alice = makeAddr("Alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployRicToken();
        ricToken = deployer.run();
        vm.prank(msg.sender);
        ricToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, ricToken.balanceOf(bob));
    }

    // Allowance: erc20 funct approve call _approve(owner,spender,amount)
    // which has _allowance[owner][spender] mapping which we update
    // when we use transferFrom we have _spendAllowance(from,spender,a mount)
    //this _spendAll funct require currentAllowance > = amount
    function testAllowanceWorks() public {
        uint256 initalAllowance = 1000;
        // Bob appoves Alice to spend
        vm.prank(bob);
        ricToken.approve(alice, initalAllowance);
        // Alice can now take token from bob account
        uint256 transferAmount = 600;
        vm.prank(alice);
        // transferFrom(From, To, amount) /// transfer(To, amount)
        ricToken.transferFrom(bob, alice, transferAmount);
        assertEq(ricToken.balanceOf(alice), transferAmount);
        assertEq(ricToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }
}
