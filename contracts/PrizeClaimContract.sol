// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "./PointingContract.sol";

contract PrizeClaimContract {
    IPointingContract public pointingContract;
    uint public prizeAmount;

    constructor(address _pointingContractAddress, uint _prizeAmountInWei) {
        pointingContract = IPointingContract(_pointingContractAddress);
        prizeAmount = _prizeAmountInWei;
    }

    receive() external payable {}

    function claimPrize() public{
        uint points = pointingContract.getPoint(msg.sender);

        require(points >= 50, "Not enough points to claim prize.");
        require(address(this).balance >= prizeAmount, "Insufficient contract balance");

        payable(msg.sender).transfer(prizeAmount);
 
    }
}