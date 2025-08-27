const { ethers } = require("hardhat");

async function main() {
    const initialSupply = ethers.utils.parseEther("1000000");
    const Token = await ethers.getContractFactory("AIXSToken");
    const token = await Token.deploy(initialSupply);
    await token.deployed();
    console.log("AIXS Token deployed to:", token.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
