// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Dummy "implementation" contract for LG Diamond interface for ERC-1967 compatibility
/// @dev adapted from https://github.com/zdenham/diamond-etherscan?tab=readme-ov-file
/// @dev This interface is used internally to call endpoints on a deployed diamond cluster.
contract SupraVRFAdminFragment {
    /// @notice Returns the VRF block deadline (TTL)
    function getVRFBlocksToRespond() external view returns (uint16) {}

    /// @notice Sets the VRF block deadline (TTL)
    /// @dev Contract owner only
    /// @param vrfBlocksToRespond The number of blocks VRF is allowed to respond within
    function setVRFBlocksToRespond(uint16 vrfBlocksToRespond) external {}

    /// @notice Returns the VRF client wallet address
    function vrfClientWallet() external view returns (address) {}

    /// @notice Sets the VRF client wallet address
    /// @dev Contract owner only
    /// @param clientWallet The new VRF client wallet address
    function setVRFClientWallet(address clientWallet) external {}

    /// @notice Returns the block number when a VRF request was made
    /// @param vrfRequestId The VRF request ID
    /// @return The block number
    function vrfRequestBlock(uint256 vrfRequestId) external view returns (uint256) {}
}
