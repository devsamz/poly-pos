const hre = require("hardhat");
const contractJSON = require("../artifacts/contracts/LekanToken.sol/LekanToken.json");
require("dotenv").config();

const contractAddress = "0xBE2FA91DaD85400C3125910b4767557AcD684cC8";
const contractABI = contractJSON.abi;

async function main() {
  const contract = await hre.ethers.getContractAt(contractABI, contractAddress);
  const totalNFTs = await contract.totalSupply();

  for (let i = 0; i < totalNFTs; i++) {
    console.log(`Prompt ${i + 1}: ${await contract.prompts(i)}`);
  }
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
