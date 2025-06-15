// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WhitelistMint is ERC721, Ownable {
    uint256 public totalMinted;
    uint256 public maxSupply = 1000;
    mapping(address => bool) public whitelisted;

    constructor() ERC721("WhitelistMint", "WMNT") Ownable(msg.sender) {}

    function addToWhitelist(address[] calldata users) external onlyOwner {
        for (uint256 i = 0; i < users.length; i++) {
            whitelisted[users[i]] = true;
        }
    }

    function mint() external {
        require(whitelisted[msg.sender], "Not whitelisted");
        require(totalMinted < maxSupply, "Max supply reached");

        totalMinted++;
        _safeMint(msg.sender, totalMinted);
    }
}