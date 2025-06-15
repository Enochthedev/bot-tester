// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BasicMint {
    uint256 public totalMinted;
    uint256 public maxSupply = 1000;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function mint() external {
        require(totalMinted < maxSupply, "Max supply reached");
        totalMinted++;
    }
}