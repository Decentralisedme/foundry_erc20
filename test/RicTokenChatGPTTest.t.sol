pragma solidity ^0.8.0;

pragma solidity ^0.8.19;

import {RicToken} from "../src/RicToken.sol";
import {DeployRicToken} from "../script/DeployRicToken.s.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

interface MintableToken {
    function mint(address, uint256) external;
}

contract RicTokenTestGPT is StdCheats, Test {
    RicToken public ricToken;
    DeployRicToken public deployer;
    address public alice;
    address public bob;

    function setUp() public {
        deployer = new DeployRicToken();
        ricToken = deployer.run();
        alice = address(0x1);
        bob = address(0x2);
    }

    function testInitialSupply() public {
        assertEq(ricToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    // function testUsersCantMint() public {
    //     vm.expectRevert();
    //     MintableToken(address(ourToken)).mint(address(this), 1);
    // }

    // function testAllowance() public {
    //     // Alice approves Bob to spend 100 tokens from her account
    //     ourToken.approve(bob, 100);
    //     assertEq(ourToken.allowance(alice, bob), 100, "Allowance is incorrect");

    //     // Bob transfers 50 tokens from Alice's account to his account
    //     ourToken.transferFrom(alice, bob, 50);
    //     assertEq(ourToken.balanceOf(alice), deployer.INITIAL_SUPPLY() - 50, "Alice's balance is incorrect after transfer");
    //     assertEq(ourToken.balanceOf(bob), 50, "Bob's balance is incorrect after transfer");
    //     assertEq(ourToken.allowance(alice, bob), 50, "Allowance is incorrect after transfer");

    //     // Attempting to transfer more than the allowance should fail
    //     vm.expectRevert();
    //     ourToken.transferFrom(alice, bob, 60);
    // }

    function testTransfer() public {
        // Alice transfers 50 tokens to Bob
        uint256 amount = 100;
        address receiver = address(0x1);
        vm.prank(msg.sender);
        ricToken.transfer(receiver, amount);
        assertEq(ricToken.balanceOf(receiver), amount);
    }

    function testBalanceAfterTransfer() public {
        uint256 amount = 100;
        address receiver = address(0x1);
        uint256 initialBalance = ricToken.balanceOf(msg.sender);
        vm.prank(msg.sender);
        ricToken.transfer(receiver, amount);
        assertEq(ricToken.balanceOf(msg.sender), initialBalance - amount);
    }

    function testTransferFrom() public {
        uint256 amount = 100;
        address receiver = address(0x1);
        vm.prank(msg.sender);
        ricToken.approve(address(this), amount);
        ricToken.transferFrom(msg.sender, receiver, amount);
        assertEq(ricToken.balanceOf(receiver), amount);
    }

    function testDecimals() public {
        assertEq(ricToken.decimals(), uint256(18), "Decimals is incorrect");
    }
}
