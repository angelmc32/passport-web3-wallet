// SPDX-License-Identifier: GNU General Public License v3.0
pragma solidity ^0.8.15;

contract PassportWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw(uint256 amount_) external onlyOwner {
        payable(msg.sender).transfer(amount_);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "PassportWallet: Only the Owner can call this method."
        );
        _;
    }

    receive() external payable {}
}
