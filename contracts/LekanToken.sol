// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LekanToken is ERC721A, Ownable {
    constructor() Ownable() ERC721A("LekanToken", "ORT") {}

    uint256 private limit = 5;
    string[] private promptTexts = [
        "A car flying in a cloudy sky",
        "A slice of pizza floating in space",
        "A glowing butterfly with stained glass wings",
        "A cozy cabin nestled among redwood trees",
        "A rainbow in a cloudy sky pouring on a busy road"
    ];
    mapping(uint256 => string) private _tokenURIs;

    function _baseURI() internal pure override returns (string memory) {
        return "QmZuDbAVCLu1RR9Z3xHtP1JCfJiKyqHRwxPPwa71Dv2CSW";
    }

    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        if (!_exists(tokenId)) revert("Token does not texis");

        string memory baseURI = _baseURI();
        string memory tokenIdStr = _toString(tokenId);
        string memory extension = ".png";
        return
            bytes(baseURI).length != 0
                ? string(abi.encodePacked(baseURI, "/", tokenIdStr, extension))
                : "";
    }

    function mint(address reciever, uint256 quantity) external onlyOwner {
        require(reciever != address(0), "Invalid Address");
        require(totalSupply() < limit, "Maximum NFT Minted");
        _safeMint(reciever, quantity);
    }

    function prompts(uint256 tokenId) public view returns (string memory) {
        return promptTexts[tokenId];
    }
}