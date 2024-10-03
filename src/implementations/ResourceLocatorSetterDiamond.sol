// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ResourceLocatorGetterDiamond} from './ResourceLocatorGetterDiamond.sol';

/// @title Dummy "implementation" contract for LG Diamond interface for ERC-1967 compatibility
/// @dev adapted from https://github.com/zdenham/diamond-etherscan?tab=readme-ov-file
/// @dev This interface is used internally to call endpoints on a deployed diamond cluster.
contract ResourceLocatorSetterDiamond {
    /// @notice Sets the Unicorn contract address
    /// @dev Contract owner only
    /// @param a The new Unicorn contract address
    function setUnicornNFTAddress(address a) public {}

    /// @notice Sets the Land contract address
    /// @dev Contract owner only
    /// @param a The new Land contract address
    function setLandNFTAddress(address a) public {}

    /// @notice Sets the Shadowcorn contract address
    /// @dev Contract owner only
    /// @param a The new Shadowcorn contract address
    function setShadowcornNFTAddress(address a) public {}

    /// @notice Sets the Gem contract address
    /// @dev Contract owner only
    /// @param a The new Gem contract address
    function setGemNFTAddress(address a) public {}

    /// @notice Sets the Ritual contract address
    /// @dev Contract owner only
    /// @param a The new Ritual contract address
    function setRitualNFTAddress(address a) public {}

    /// @notice Sets the RBW Token contract address
    /// @dev Contract owner only
    /// @param a The new RBW Token contract address
    function setRBWTokenAddress(address a) public {}

    /// @notice Sets the CU Token contract address
    /// @dev Contract owner only
    /// @param a The new CU Token contract address
    function setCUTokenAddress(address a) public {}

    /// @notice Sets the UNIM Token contract address
    /// @dev Contract owner only
    /// @param a The new UNIM Token contract address
    function setUNIMTokenAddress(address a) public {}

    /// @notice Sets the WETH Token contract address
    /// @dev Contract owner only
    /// @param a The new WETH Token contract address
    function setWETHTokenAddress(address a) public {}

    /// @notice Sets the Dark Mark Token contract address
    /// @dev Contract owner only
    /// @param a The new Dark Mark Token contract address
    function setDarkMarkTokenAddress(address a) public {}

    /// @notice Sets the Unicorn Items contract address
    /// @dev Contract owner only
    /// @param a The new Unicorn Items contract address
    function setUnicornItemsAddress(address a) public {}

    /// @notice Sets the Shadowcorn Items contract address
    /// @dev Contract owner only
    /// @param a The new Shadowcorn Items contract address
    function setShadowcornItemsAddress(address a) public {}

    /// @notice Sets the Access Control Badge contract address
    /// @dev Contract owner only
    /// @param a The new Access Control Badge contract address
    function setAccessControlBadgeAddress(address a) public {}

    /// @notice Sets the Game Bank contract address
    /// @dev Contract owner only
    /// @param a The new Game Bank contract address
    function setGameBankAddress(address a) public {}

    /// @notice Sets the Satellite Bank contract address
    /// @dev Contract owner only
    /// @param a The new Satellite Bank contract address
    function setSatelliteBankAddress(address a) public {}

    /// @notice Sets the Player Profile contract address
    /// @dev Contract owner only
    /// @param a The new Player Profile contract address
    function setPlayerProfileAddress(address a) public {}

    /// @notice Sets the Shadow Forge contract address
    /// @dev Contract owner only
    /// @param a The new Shadow Forge contract address
    function setShadowForgeAddress(address a) public {}

    /// @notice Sets the Dark Forest contract address
    /// @dev Contract owner only
    /// @param a The new Dark Forest contract address
    function setDarkForestAddress(address a) public {}

    /// @notice Sets the Game Server SSS contract address
    /// @dev Contract owner only
    /// @param a The new Game Server SSS contract address
    function setGameServerSSSAddress(address a) public {}

    /// @notice Sets the Game Server Oracle contract address
    /// @dev Contract owner only
    /// @param a The new Game Server Oracle contract address
    function setGameServerOracleAddress(address a) public {}

    /// @notice Sets the Testnet Debug Registry address
    /// @dev Contract owner only
    /// @param a The new Testnet Debug Registry address
    function setTestnetDebugRegistryAddress(address a) public {}

    /// @notice Copies the addresses from an existing diamond onto this one
    /// @dev Contract owner only
    /// @param diamond The existing diamond to clone from
    function importResourcesFromDiamond(address diamond) public {}
}
