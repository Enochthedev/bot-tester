// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "../lib/forge-std/src/Script.sol";
import "../src/BasicMint.sol";
import "../src/WhitelistMint.sol";
import "../src/TimedMint.sol";

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();

        // Free Mint
        new BasicMint();

        // Whitelist Mint
        new WhitelistMint();

        // Timed Mint (starts in 5 minutes)
        new TimedMint(block.timestamp + 5 minutes);

        vm.stopBroadcast();
    }
}