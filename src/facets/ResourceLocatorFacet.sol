// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {LibResourceLocator} from "../libraries/LibResourceLocator.sol";
import {IResourceLocator} from "../interfaces/IResourceLocator.sol";
import {LibContractOwner} from "../../lib/@lagunagames/cu-diamond-template/src/libraries/LibContractOwner.sol";

/// @title Resource Locator Admin facet for Crypto Unicorns
/// @author rsampson@laguna.games
contract ResourceLocatorFacet is IResourceLocator {
    /// @notice Returns the Unicorn contract address
    function unicornNFTAddress() public view returns (address) {
        return LibResourceLocator.unicornNFT();
    }

    /// @notice Sets the Unicorn contract address
    /// @dev Contract owner only
    /// @param a The new Unicorn contract address
    function setUnicornNFTAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setUnicornNFT(a);
    }

    /// @notice Returns the Land contract address
    function landNFTAddress() public view returns (address) {
        return LibResourceLocator.landNFT();
    }

    /// @notice Sets the Land contract address
    /// @dev Contract owner only
    /// @param a The new Land contract address
    function setLandNFTAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setLandNFT(a);
    }

    /// @notice Returns the Shadowcorn contract address
    function shadowcornNFTAddress() public view returns (address) {
        return LibResourceLocator.shadowcornNFT();
    }

    /// @notice Sets the Shadowcorn contract address
    /// @dev Contract owner only
    /// @param a The new Shadowcorn contract address
    function setShadowcornNFTAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setShadowcornNFT(a);
    }

    /// @notice Returns the Gem contract address
    function gemNFTAddress() public view returns (address) {
        return LibResourceLocator.gemNFT();
    }

    /// @notice Sets the Gem contract address
    /// @dev Contract owner only
    /// @param a The new Gem contract address
    function setGemNFTAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setGemNFT(a);
    }

    /// @notice Returns the Ritual contract address
    function ritualNFTAddress() public view returns (address) {
        return LibResourceLocator.ritualNFT();
    }

    /// @notice Sets the Ritual contract address
    /// @dev Contract owner only
    /// @param a The new Ritual contract address
    function setRitualNFTAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setRitualNFT(a);
    }

    /// @notice Returns the RBW Token contract address
    function rbwTokenAddress() public view returns (address) {
        return LibResourceLocator.rbwToken();
    }

    /// @notice Sets the RBW Token contract address
    /// @dev Contract owner only
    /// @param a The new RBW Token contract address
    function setRBWTokenAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setRBWToken(a);
    }

    /// @notice Returns the CU Token contract address
    function cuTokenAddress() public view returns (address) {
        return LibResourceLocator.cuToken();
    }

    /// @notice Sets the CU Token contract address
    /// @dev Contract owner only
    /// @param a The new CU Token contract address
    function setCUTokenAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setCUToken(a);
    }

    /// @notice Returns the UNIM Token contract address
    function unimTokenAddress() public view returns (address) {
        return LibResourceLocator.unimToken();
    }

    /// @notice Sets the UNIM Token contract address
    /// @dev Contract owner only
    /// @param a The new UNIM Token contract address
    function setUNIMTokenAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setUNIMToken(a);
    }

    /// @notice Returns the WETH Token contract address
    function wethTokenAddress() public view returns (address) {
        return LibResourceLocator.wethToken();
    }

    /// @notice Sets the WETH Token contract address
    /// @dev Contract owner only
    /// @param a The new WETH Token contract address
    function setWETHTokenAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setWETHToken(a);
    }

    /// @notice Returns the Dark Mark Token contract address
    function darkMarkTokenAddress() public view returns (address) {
        return LibResourceLocator.darkMarkToken();
    }

    /// @notice Sets the Dark Mark Token contract address
    /// @dev Contract owner only
    /// @param a The new Dark Mark Token contract address
    function setDarkMarkTokenAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setDarkMarkToken(a);
    }

    /// @notice Returns the Unicorn Items contract address
    function unicornItemsAddress() public view returns (address) {
        return LibResourceLocator.unicornItems();
    }

    /// @notice Sets the Unicorn Items contract address
    /// @dev Contract owner only
    /// @param a The new Unicorn Items contract address
    function setUnicornItemsAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setUnicornItems(a);
    }

    /// @notice Returns the Shadowcorn Items contract address
    function shadowcornItemsAddress() public view returns (address) {
        return LibResourceLocator.shadowcornItems();
    }

    /// @notice Sets the Shadowcorn Items contract address
    /// @dev Contract owner only
    /// @param a The new Shadowcorn Items contract address
    function setShadowcornItemsAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setShadowcornItems(a);
    }

    /// @notice Returns the Access Control Badge contract address
    function accessControlBadgeAddress() public view returns (address) {
        return LibResourceLocator.accessControlBadge();
    }

    /// @notice Sets the Access Control Badge contract address
    /// @dev Contract owner only
    /// @param a The new Access Control Badge contract address
    function setAccessControlBadgeAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setAccessControlBadge(a);
    }

    /// @notice Returns the Game Bank contract address
    function gameBankAddress() public view returns (address) {
        return LibResourceLocator.gameBank();
    }

    /// @notice Sets the Game Bank contract address
    /// @dev Contract owner only
    /// @param a The new Game Bank contract address
    function setGameBankAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setGameBank(a);
    }

    /// @notice Returns the Satellite Bank contract address
    function satelliteBankAddress() public view returns (address) {
        return LibResourceLocator.satelliteBank();
    }

    /// @notice Sets the Satellite Bank contract address
    /// @dev Contract owner only
    /// @param a The new Satellite Bank contract address
    function setSatelliteBankAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setSatelliteBank(a);
    }

    /// @notice Returns the Player Profile contract address
    function playerProfileAddress() public view returns (address) {
        return LibResourceLocator.playerProfile();
    }

    /// @notice Sets the Player Profile contract address
    /// @dev Contract owner only
    /// @param a The new Player Profile contract address
    function setPlayerProfileAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setPlayerProfile(a);
    }

    /// @notice Returns the Shadow Forge contract address
    function shadowForgeAddress() public view returns (address) {
        return LibResourceLocator.shadowForge();
    }

    /// @notice Sets the Shadow Forge contract address
    /// @dev Contract owner only
    /// @param a The new Shadow Forge contract address
    function setShadowForgeAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setShadowForge(a);
    }

    /// @notice Returns the Dark Forest contract address
    function darkForestAddress() public view returns (address) {
        return LibResourceLocator.darkForest();
    }

    /// @notice Sets the Dark Forest contract address
    /// @dev Contract owner only
    /// @param a The new Dark Forest contract address
    function setDarkForestAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setDarkForest(a);
    }

    /// @notice Returns the Game Server SSS contract address
    function gameServerSSSAddress() public view returns (address) {
        return LibResourceLocator.gameServerSSS();
    }

    /// @notice Sets the Game Server SSS contract address
    /// @dev Contract owner only
    /// @param a The new Game Server SSS contract address
    function setGameServerSSSAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setGameServerSSS(a);
    }

    /// @notice Returns the Game Server Oracle contract address
    function gameServerOracleAddress() public view returns (address) {
        return LibResourceLocator.gameServerOracle();
    }

    /// @notice Sets the Game Server Oracle contract address
    /// @dev Contract owner only
    /// @param a The new Game Server Oracle contract address
    function setGameServerOracleAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setGameServerOracle(a);
    }

    /// @notice Returns the Testnet Debug Registry address
    function testnetDebugRegistryAddress() external view returns (address) {
        return LibResourceLocator.testnetDebugRegistry();
    }

    /// @notice Sets the Testnet Debug Registry address
    /// @dev Contract owner only
    /// @param a The new Testnet Debug Registry address
    function setTestnetDebugRegistryAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setTestnetDebugRegistry(a);
    }

    /// @notice Returns the VRF Oracle contract address
    function vrfOracleAddress() public view returns (address) {
        return LibResourceLocator.vrfOracle();
    }

    /// @notice Sets the VRF Oracle contract address
    /// @dev Contract owner only
    /// @param a The new VRF Oracle contract address
    function setVRFOracleAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setVRFOracle(a);
    }

    /// @notice Returns the VRF Client Wallet address
    function vrfClientWalletAddress() public view returns (address) {
        return LibResourceLocator.vrfClientWallet();
    }

    /// @notice Sets the VRF Client Wallet (payer) address
    /// @dev Contract owner only
    /// @param a The new VRF Client Wallet address
    function setVRFClientWalletAddress(address a) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.setVRFClientWallet(a);
    }

    /// @notice Copies the addresses from an existing diamond onto this one
    /// @dev Contract owner only
    /// @param diamond The existing diamond to clone from
    function importResourcesFromDiamond(address diamond) public {
        LibContractOwner.enforceIsContractOwner();
        LibResourceLocator.importResourcesFromDiamond(diamond);
    }
}
