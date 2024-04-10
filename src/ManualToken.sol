//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManualToken {
    // You balance is just a mapping (address to amount)
    mapping(address => uint256) privates_balances;
    // We have list of functions that have to be here
    //Name
    function name() public view returns (string memory) {
        return "Manual Token";
    }
    // Supply
    function totalSupply() public view returns (uint256) {
        return 100 ether;
    }
    // Decimals
    function decimals() public pure returns (uint8) {
        return 18;
    }

    // Balance
    // function balanceOf(address _owner) public view returns (uint256) {
    //     return s_balances(_owner);
    // }

    function tranfer(
        address _to,
        uint256 _amount
    ) public view returns (uint256) {
        // uint256 previousBalance = balanceOf(msg.sender) + balancOf(_to);
        // // s_balance(smsg.sender) -= _amount;
        // // s_balances(_to) += _amount;
        // require();
    }
}
