require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
require('dotenv').config()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.16",
  defaultNetwork: "rinkeby",
  networks: {
      matic: {
        url: "https://polygon-mainnet.g.alchemy.com/v2/" + process.env.ALCHEMY_POLYGON_MAINNET_API_KEY,
        accounts: [process.env.PRIVATE_KEY],
      },
      goerli: {
        url: "https://eth-goerli.g.alchemy.com/v2/" + process.env.ALCHEMY_RINKEBY_API_KEY,
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
    apiKey: process.env.ETHERSCAN_API_KEY
  },
};
