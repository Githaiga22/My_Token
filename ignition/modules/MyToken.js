// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("MyTokenModule", (m) => {
  const initialSupply = m.getParameter("initialSupply", 1_000_000n);

  const myToken = m.contract("MyToken", [initialSupply]);

  return { myToken };
});