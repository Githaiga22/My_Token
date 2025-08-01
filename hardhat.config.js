require("@nomicfoundation/hardhat-toolbox");

const PRIVATE_KEY = vars.get("PRIVATE_KEY");
const ALCHEMY_API_KEY = vars.get("ALCHEMY_API_KEY");
const ETHERSCAN_API_KEY = vars.get("ETHERSCAN_API_KEY");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  network: "sepolia",

  networks: {
    sepolia: {
      url: `https://sepolia.drpc.org`,
      accounts: [PRIVATE_KEY],
    }
  },

  etherscan: {
    apiKey: {
      sepolia: ETHERSCAN_API_KEY
    }
  }

};