require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
require('dotenv').config()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.16",
  defaultNetwork: "matic",
  networks: {
      hardhat: {},
      matic: {
        url: "https://polygon-mainnet.g.alchemy.com/v2/" + process.env.ALCHEMY_URL,
        accounts: [process.env.PRIVATE_KEY],
      }
  },
  settings: {
    optimizer: {
      enabled: true,
      runs: 10000,
    },
  },
  etherscan: {
    apiKey: "DZPE8JI3M8BMBHF9P2FZATYITB2RTVAZAV",
  },
};
