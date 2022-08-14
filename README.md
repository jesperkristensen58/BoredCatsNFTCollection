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

That was it!