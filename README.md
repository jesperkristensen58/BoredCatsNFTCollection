<h1>Welcome to the Bored Cats Collection</h1>

I deployed this to the Polygon Mainnet. The deployment went like this:

    npx hardhat run scripts/deploy.js --network matic
    BoredCats deployed to 0x0E956Ee37839965d809eC21357B3F97AD3D35FED

Then, I verified the contract deployment:

    npx hardhat verify --network matic 0x0E956Ee37839965d809eC21357B3F97AD3D35FED
    Nothing to compile
    Successfully submitted source code for contract
    contracts/BoredCats.sol:BoredCats at 0x0E956Ee37839965d809eC21357B3F97AD3D35FED
    for verification on the block explorer. Waiting for verification result...

    Successfully verified contract BoredCats on Etherscan.
    https://polygonscan.com/address/0x0E956Ee37839965d809eC21357B3F97AD3D35FED#code

To deploy on Goerli I did a similar think:

    npx hardhat run scripts/deploy.js
    
    Compiled 1 Solidity file successfully
    BoredCats deployed to 0x3Da3752a9fc4Ac65F1ADfeb4E108c75a5e8dcCD1

Then verified with:

    npx hardhat verify --network goerli 0x3Da3752a9fc4Ac65F1ADfeb4E108c75a5e8dcCD1
    
    Nothing to compile
    Successfully submitted source code for contract
    contracts/BoredCats.sol:BoredCats at 0x3Da3752a9fc4Ac65F1ADfeb4E108c75a5e8dcCD1
    for verification on the block explorer. Waiting for verification result...

    Successfully verified contract BoredCats on Etherscan.
    https://goerli.etherscan.io/address/0x3Da3752a9fc4Ac65F1ADfeb4E108c75a5e8dcCD1#code

Then I deployed to Rinkeby:

    npx hardhat run scripts/deploy.js

    Compiled 1 Solidity file successfully
    BoredCats deployed to 0x9047A22Ca6f9121d0edF1E7F855A0606dbC0CdA1

Now I verified:

    npx hardhat verify --network rinkeby 0x9047A22Ca6f9121d0edF1E7F855A0606dbC0CdA1

    Nothing to compile
    Successfully submitted source code for contract
    contracts/BoredCats.sol:BoredCats at 0x9047A22Ca6f9121d0edF1E7F855A0606dbC0CdA1
    for verification on the block explorer. Waiting for verification result...

    Successfully verified contract BoredCats on Etherscan.
    https://rinkeby.etherscan.io/address/0x9047A22Ca6f9121d0edF1E7F855A0606dbC0CdA1#code

Then I went onto Rinkeby's Etherscan and minted an NFT directly from etherscan myself using the write to the contract functionality. I confirmed the NFT was minted via the transaction details and also by interacting with the read part of Etherscan.

That was it!

## Contact
[![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/cryptojesperk.svg?style=social&label=Follow%20%40cryptojesperk)](https://twitter.com/cryptojesperk)


## License
This project uses the following license: [MIT](https://github.com/bisguzar/twitter-scraper/blob/master/LICENSE).
