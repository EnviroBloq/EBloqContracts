// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

/// @custom:security-contact security@envirobloq.io
contract RdEbloq is ERC20, Ownable {
    constructor(address initialOwner)
        ERC20("3rdEbloq", "3EB")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 500000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}