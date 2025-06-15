// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TimedMint is ERC721, Ownable {
    uint256 public totalMinted;
    uint256 public maxSupply = 1000;
    uint256 public startTime;

    constructor(uint256 _startTime) ERC721("TimedMint", "TMNT") Ownable(msg.sender) {
        startTime = _startTime;
    }

    function mint() external {
        require(block.timestamp >= startTime, "Minting not started yet");
        require(totalMinted < maxSupply, "Max supply reached");

        totalMinted++;
        _safeMint(msg.sender, totalMinted);
    }
}