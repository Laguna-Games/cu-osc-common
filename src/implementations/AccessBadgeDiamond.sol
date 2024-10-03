// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Dummy "implementation" contract for LG Diamond interface for ERC-1967 compatibility
/// @dev adapted from https://github.com/zdenham/diamond-etherscan?tab=readme-ov-file
/// @dev This interface is used internally to call endpoints on a deployed diamond cluster.
contract AccessBadgeDiamond {
    /// @notice Returns the 1155 pool ID for a badge
    /// @param name The name of the badge (registered on this contract)
    /// @return poolId The pool ID for the badge, on the AccessControl contract
    function getPoolByName(string memory name) external view returns (uint256 poolId) {}

    /// @notice Assign a name to an 1155 pool on the AccessControl contract
    /// @dev Contract owner only
    /// @param name The name of the badge
    /// @param poolId The pool ID for the badge, on the AccessControl contract
    function setPoolName(uint256 poolId, string memory name) external {}

    /// @notice Throw an error if the sender does not have the required badge
    /// @param badge The name of the badge
    /// @custom:throws AccessBadgeRequired
    function requireBadge(string memory badge) external view {}

    /// @notice Throw an error if the sender does not have the required badge
    /// @param poolId The pool ID of the badge
    /// @custom:throws AccessTokenRequired
    function requireBadgeById(uint256 poolId) external view {}

    /// @notice Check if an address has a badge
    /// @param a The address to check
    /// @param badge The name of the badge
    /// @return true if the address has the badge
    function hasBadge(address a, string memory badge) external view returns (bool) {}

    /// @notice Check if an address has a badge
    /// @param a The address to check
    /// @param poolId The pool ID for the badge
    /// @return true if the address has the badge
    function hasBadgeById(address a, uint256 poolId) external view returns (bool) {}
}
