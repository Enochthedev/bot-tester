// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/forge-std/src/Script.sol";

interface IBasicMint {
    function mint() external;
}

contract MintCall is Script {
    function run() external {
        vm.startBroadcast();
        IBasicMint(0xF434875962797beA121357bBfb6f7301394E73d4).mint();
        vm.stopBroadcast();
    }
}