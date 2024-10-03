// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Dummy "implementation" contract for LG Diamond interface for ERC-1967 compatibility
/// @dev adapted from https://github.com/zdenham/diamond-etherscan?tab=readme-ov-file
/// @dev This interface is used internally to call endpoints on a deployed diamond cluster.
contract ResourceLocatorGetterDiamond {
    /// @notice Returns the Unicorn contract address
    function unicornNFTAddress() public view returns (address) {}

    /// @notice Returns the Land contract address
    function landNFTAddress() public view returns (address) {}

    /// @notice Returns the Shadowcorn contract address
    function shadowcornNFTAddress() public view returns (address) {}

    /// @notice Returns the Gem contract address
    function gemNFTAddress() public view returns (address) {}

    /// @notice Returns the Ritual contract address
    function ritualNFTAddress() public view returns (address) {}

    /// @notice Returns the RBW Token contract address
    function rbwTokenAddress() public view returns (address) {}

    /// @notice Returns the CU Token contract address
    function cuTokenAddress() public view returns (address) {}

    /// @notice Returns the UNIM Token contract address
    function unimTokenAddress() public view returns (address) {}

    /// @notice Returns the WETH Token contract address
    function wethTokenAddress() public view returns (address) {}

    /// @notice Returns the Dark Mark Token contract address
    function darkMarkTokenAddress() public view returns (address) {}

    /// @notice Returns the Unicorn Items contract address
    function unicornItemsAddress() public view returns (address) {}

    /// @notice Returns the Shadowcorn Items contract address
    function shadowcornItemsAddress() public view returns (address) {}

    /// @notice Returns the Access Control Badge contract address
    function accessControlBadgeAddress() public view returns (address) {}

    /// @notice Returns the Game Bank contract address
    function gameBankAddress() public view returns (address) {}

    /// @notice Returns the Satellite Bank contract address
    function satelliteBankAddress() public view returns (address) {}

    /// @notice Returns the Player Profile contract address
    function playerProfileAddress() public view returns (address) {}

    /// @notice Returns the Shadow Forge contract address
    function shadowForgeAddress() public view returns (address) {}

    /// @notice Returns the Dark Forest contract address
    function darkForestAddress() public view returns (address) {}

    /// @notice Returns the Game Server SSS contract address
    function gameServerSSSAddress() public view returns (address) {}

    /// @notice Returns the Game Server Oracle contract address
    function gameServerOracleAddress() public view returns (address) {}

    /// @notice Returns the Testnet Debug Registry address
    /// @dev Available on testnet deployments only
    function testnetDebugRegistryAddress() external view returns (address) {}
}
