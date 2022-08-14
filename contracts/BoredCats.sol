// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @notice The BoredCats NFT Collection.
 * @author Jesper Kristensen
 */
contract BoredCats is ERC721 {

    string private baseURI = "QmaZ9xaXHEYykWg1iK3Q6N4P88jcjcHr6bZ1g5onkuopzE"; // the base URI of the metadata of our collection
    uint256 public constant MAX_SUPPLY = 10;
    address immutable deployer;  // do not use Ownable, we don't want to transfer ownership ever
    uint256 public tokenSupply = 0;
    
    constructor() ERC721("BoredCats", "BC") {
        deployer = msg.sender;
    }

    /**
     * @notice ensure only the deployer/owner can call a function.
     * @dev like Ownable, but does not import owner transfership.
     */
    modifier onlyOwner() {
        require(msg.sender == deployer);
        _;
    }

    /**
     * @notice Mint a new NFT from the Collection!
     * @dev the NFT is sent to the caller.
     * @dev the total supply cannot be beyond the max supply, we will throw an error if it would be.
     * @dev the collection is free to mint
     */
    function mint() external {
        require(tokenSupply < MAX_SUPPLY, "Supply used up!");

        // the collection is free
        // mint a new NFT and ID it by the tokensupply variable
        _mint(msg.sender, tokenSupply);
        tokenSupply++;
    }

    /**
     * @notice Check the amount of funds currently in the contract.
     */
    function viewBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /**
     * @notice Withdraw funds received from selling the Collection.
     */
    function withdraw() external onlyOwner {
        (bool ok,) = payable(msg.sender).call{value: address(this).balance}("");
        require(ok, "Transfer of funds failed!");
    }

    /**
     * @notice Change the base URI of this NFT collection.
     * @param newURI The new base URI of this NFT collection.
     */
    function changeBaseURI(string calldata newURI) external onlyOwner {
        // WARNING: This will change the base URI of the collection
        // and the metadata that it points to. Use with CAUTION.
        baseURI = newURI;
    }

    /**
     * @notice the Base URI of our Collection hosted on IPFS.
     * @dev Pinata and IPFS Desktop were used to confirm the hash.
     */
    function _baseURI() internal view override returns (string memory) {
        return string.concat("ipfs://", baseURI, "/");
    }
}