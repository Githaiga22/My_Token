// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("PrizeClaimContractModule", (m) => {

  const pointingContractAddress = m.getParameter("pointingContractAddress", "0x33Aa4B4a412Afa383d7098D27b37ec95368Cb5Eb");
  const prizeAmountInWei = m.getParameter("prizeAmountInWei", 1_000_000n);
  const prizeClaimContract = m.contract("PrizeClaimContract", [pointingContractAddress, prizeAmountInWei]);

  return { prizeClaimContract };
});