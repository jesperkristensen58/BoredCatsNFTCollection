const hre = require("hardhat");

// run with `npx hardhat run scripts/deploy.js`
async function main() {

  const BoredCats = await hre.ethers.getContractFactory("BoredCats");
  const boredCats = await BoredCats.deploy();

  await boredCats.deployed();

  console.log(
    `BoredCats deployed to ${boredCats.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
