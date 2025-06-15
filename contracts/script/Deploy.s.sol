// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/forge-std/src/Script.sol";
import "../src/BasicMint.sol";

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();
        new BasicMint();
        vm.stopBroadcast();
    }
}