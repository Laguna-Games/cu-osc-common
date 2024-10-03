// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {LibContractOwner} from "../../lib/cu-osc-diamond-template/src/libraries/LibContractOwner.sol";
import {LibRNG} from "../libraries/LibRNG.sol";

/// @title VRF Admin facet for Crypto Unicorns
contract SupraVRFAdminFacet {
    /// @notice Returns the VRF block deadline (TTL)
    function getVRFBlocksToRespond() external view returns (uint16) {
        return LibRNG.rngStorage().blocksToRespond;
    }

    /// @notice Sets the VRF block deadline (TTL)
    /// @dev Contract owner only
    /// @param vrfBlocksToRespond The number of blocks VRF is allowed to respond within
    function setVRFBlocksToRespond(uint16 vrfBlocksToRespond) external {
        LibContractOwner.enforceIsContractOwner();
        LibRNG.rngStorage().blocksToRespond = vrfBlocksToRespond;
    }

    /// @notice Returns the VRF client wallet address
    function vrfClientWallet() external view returns (address) {
        return LibRNG.rngStorage().supraClientWallet;
    }

    /// @notice Sets the VRF client wallet address
    /// @dev Contract owner only
    /// @param clientWallet The new VRF client wallet address
    function setVRFClientWallet(address clientWallet) external {
        LibContractOwner.enforceIsContractOwner();
        LibRNG.rngStorage().supraClientWallet = clientWallet;
    }

    /// @notice Returns the block number when a VRF request was made
    /// @param vrfRequestId The VRF request ID
    /// @return The block number
    function vrfRequestBlock(
        uint256 vrfRequestId
    ) external view returns (uint256) {
        return LibRNG.rngStorage().blockRequested[vrfRequestId];
    }
}
