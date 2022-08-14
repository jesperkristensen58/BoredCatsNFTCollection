// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @notice We use this Mixin because we are deploying on Polygon's network for OpenSea.
 * @dev See this: https://docs.opensea.io/docs/polygon-basic-integration
 * @dev From: https://github.com/maticnetwork/pos-portal/blob/master/contracts/common/ContextMixin.sol
 */
abstract contract ContextMixin {
    function msgSender()
        internal
        view
        returns (address payable sender)
    {
        if (msg.sender == address(this)) {
            bytes memory array = msg.data;
            uint256 index = msg.data.length;
            assembly {
                // Load the 32 bytes word from memory with the address on the lower 20 bytes, and mask those.
                sender := and(
                    mload(add(array, index)),
                    0xffffffffffffffffffffffffffffffffffffffff
                )
            }
        } else {
            sender = payable(msg.sender);
        }
        return sender;
    }
}

/**
 * @notice The BoredCats NFT Collection.
 * @author Jesper Kristensen
 */
contract BoredCats is ERC721, ContextMixin {

    uint256 public constant MAX_SUPPLY = 10;
    address immutable deployer;  // do not use Ownable, we don't want to transfer ownership ever
    uint256 public tokenSupply = 0;
    
    constructor() ERC721("BoredCats", "BC") {
        deployer = msg.sender;
    }

    /**
     * This is used instead of msg.sender as transactions won't be sent by the original token owner, but by OpenSea.
     */
    function _msgSender()
        internal
        override
        view
        returns (address sender)
    {
        return ContextMixin.msgSender();
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
     * @notice the Base URI of our Collection hosted on IPFS.
     * @dev Pinata and IPFS Desktop were used to confirm the hash.
     */
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmaZ9xaXHEYykWg1iK3Q6N4P88jcjcHr6bZ1g5onkuopzE/";
    }

    /**
    * @notice Override isApprovedForAll to auto-approve OS's proxy contract
    */
    function isApprovedForAll(
        address _owner,
        address _operator
    ) public override view returns (bool isOperator) {
      // if OpenSea's ERC721 Proxy Address is detected, auto-return true
      // for Polygon's Mumbai testnet, use 0xff7Ca10aF37178BdD056628eF42fD7F799fAc77c
        if (_operator == address(0x58807baD0B376efc12F5AD86aAc70E78ed67deaE)) {
            return true;
        }
        
        // otherwise, use the default ERC721.isApprovedForAll()
        return ERC721.isApprovedForAll(_owner, _operator);
    }
}