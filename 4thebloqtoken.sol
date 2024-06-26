// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FourthBbloq is ERC20, ERC20Permit, Ownable {
    uint256 public immutable maxSupply;

    constructor(address initialOwner) 
        ERC20("4thBbloq", "4EB") 
        ERC20Permit("4thBbloq") 
        Ownable(initialOwner){
        maxSupply = 500000000 * 10 ** decimals();
        mint(msg.sender, 250000000 * 10 ** decimals()); // Pre-mint 250 million tokens 
    }   
    
    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= maxSupply, "Minting would exceed max supply");
        _mint(to, amount);
    }
}