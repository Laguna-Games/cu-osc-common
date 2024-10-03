// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {IERC1155} from '../../lib/openzeppelin-contracts/contracts/token/ERC1155/IERC1155.sol';
import {LibResourceLocator} from './LibResourceLocator.sol';

/// @title LG Access Library
/// @author rsampson@laguna.games
/// @notice Library for checking permission via 1155 badges
/// @custom:storage-location erc7201:games.laguna.LibAccessBadge
library LibAccessBadge {
    error PoolNameUndefined(string badge);
    error InvalidPoolId(uint256 poolId);
    error AccessBadgeRequired(address caller, string badge);
    error AccessTokenRequired(address caller, uint256 poolId);
    error ERC1155TokenRequired(address caller, address token, uint256 poolId);

    //  @dev Storage slot for LG Resource addresses
    bytes32 internal constant ACCESS_BADGE_SLOT_POSITION =
        keccak256(abi.encode(uint256(keccak256('games.laguna.LibAccessBadge')) - 1)) & ~bytes32(uint256(0xff));

    struct AccessBadgeStorageStruct {
        //  String handles for 1155 pools
        mapping(string name => uint256 poolId) namedBadges;
        //  List of all pools that have been named
        uint256[] namedPools;
    }

    /// @notice Storage slot for Access Badge state data
    function accessBadgeStorage() internal pure returns (AccessBadgeStorageStruct storage storageSlot) {
        bytes32 position = ACCESS_BADGE_SLOT_POSITION;

        // solhint-disable-next-line no-inline-assembly
        assembly {
            storageSlot.slot := position
        }
    }

    function getPoolByName(string memory name) internal view returns (uint256 poolId) {
        return accessBadgeStorage().namedBadges[name];
    }

    function setPoolName(uint256 poolId, string memory name) internal {
        require(poolId > 0, 'InvalidPoolId: Must be > 0');
        accessBadgeStorage().namedBadges[name] = poolId;
        uint256 poolCount = accessBadgeStorage().namedPools.length;
        for (uint256 i = 0; i < poolCount; ++i) {
            if (accessBadgeStorage().namedPools[i] == poolId) {
                return;
            }
        }
        accessBadgeStorage().namedPools.push(poolId);
    }

    function requireBadge(string memory name) internal view {
        uint256 poolId = getPoolByName(name);
        if (poolId == 0) revert PoolNameUndefined(name);
        if (!hasBadgeById(msg.sender, poolId)) {
            revert AccessBadgeRequired(msg.sender, name);
        }
    }

    function requireBadgeById(uint256 poolId) internal view {
        if (poolId == 0) revert InvalidPoolId(poolId);
        if (!hasBadgeById(msg.sender, poolId)) {
            revert AccessTokenRequired(msg.sender, poolId);
        }
    }

    function hasBadge(address a, string memory name) internal view returns (bool) {
        return hasBadgeById(a, getPoolByName(name));
    }

    function hasBadgeById(address a, uint256 poolId) internal view returns (bool) {
        IERC1155 terminus = IERC1155(LibResourceLocator.accessControlBadge());
        return terminus.balanceOf(a, poolId) > 0;
    }
}
