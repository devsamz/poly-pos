const hre = require("hardhat");
const contractJSON = require("../artifacts/contracts/MitToken.sol/LekanToken.json");

const contractAddress = "0xBE2FA91DaD85400C3125910b4767557AcD684cC8";
const contractABI = contractJSON.abi;
const walletAddress = "0xB2AF542dA937A6aC46228eBA63f21A7EFc40C70E";

async function main() {
  const contract = await hre.ethers.getContractAt(contractABI, contractAddress);

  console.log(
    `${walletAddress} has: ${await contract.balanceOf(walletAddress)} NFTs`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});