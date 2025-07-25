// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BasicMint is ERC721, Ownable {
    uint256 public totalMinted;
    uint256 public maxSupply = 1000;

    // Pass both ERC721 and Ownable constructors
    constructor()
        ERC721("BasicMint", "BMNT")
        Ownable(msg.sender)
    {
        // msg.sender is both the contract deployer and owner
    }

    function mint() external {
        require(totalMinted < maxSupply, "Max supply reached");
        uint256 tokenId = totalMinted + 1;
        totalMinted++;
        _safeMint(msg.sender, tokenId);
    }
}