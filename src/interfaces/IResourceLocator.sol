// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Resource Locator for Crypto Unicorns
/// @author rsampson@laguna.games
interface IResourceLocator {
    /// @notice Returns the Unicorn NFT contract address
    function unicornNFTAddress() external view returns (address);

    /// @notice Returns the Land NFT contract address
    function landNFTAddress() external view returns (address);

    /// @notice Returns the Shadowcorn NFT contract address
    function shadowcornNFTAddress() external view returns (address);

    /// @notice Returns the Gem NFT contract address
    function gemNFTAddress() external view returns (address);

    /// @notice Returns the Ritual NFT contract address
    function ritualNFTAddress() external view returns (address);

    /// @notice Returns the RBW Token contract address
    function rbwTokenAddress() external view returns (address);

    /// @notice Returns the CU Token contract address
    function cuTokenAddress() external view returns (address);

    /// @notice Returns the UNIM Token contract address
    function unimTokenAddress() external view returns (address);

    /// @notice Returns the WETH Token contract address
    function wethTokenAddress() external view returns (address);

    /// @notice Returns the DarkMark Token contract address
    function darkMarkTokenAddress() external view returns (address);

    /// @notice Returns the Unicorn Items contract address
    function unicornItemsAddress() external view returns (address);

    /// @notice Returns the Shadowcorn Items contract address
    function shadowcornItemsAddress() external view returns (address);

    /// @notice Returns the Access Control Badge contract address
    function accessControlBadgeAddress() external view returns (address);

    /// @notice Returns the GameBank contract address
    function gameBankAddress() external view returns (address);

    /// @notice Returns the SatelliteBank contract address
    function satelliteBankAddress() external view returns (address);

    /// @notice Returns the PlayerProfile contract address
    function playerProfileAddress() external view returns (address);

    /// @notice Returns the Shadow Forge contract address
    function shadowForgeAddress() external view returns (address);

    /// @notice Returns the Dark Forest contract address
    function darkForestAddress() external view returns (address);

    /// @notice Returns the Game Server SSS contract address
    function gameServerSSSAddress() external view returns (address);

    /// @notice Returns the Game Server Oracle contract address
    function gameServerOracleAddress() external view returns (address);

    /// @notice Returns the VRF Oracle contract address
    function vrfOracleAddress() external view returns (address);

    /// @notice Returns the VRF Client Wallet address
    function vrfClientWalletAddress() external view returns (address);

    /// @notice Returns the Testnet Debug Registry address
    /// @dev Available on testnet deployments only
    function testnetDebugRegistryAddress() external view returns (address);
}
