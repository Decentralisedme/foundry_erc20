//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {RicToken} from "../src/RicToken.sol";

contract DeployRicToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (RicToken) {
        vm.startBroadcast();
        RicToken ricToken = new RicToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return ricToken;
    }
}
