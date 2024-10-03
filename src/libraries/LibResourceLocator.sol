// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {IERC165} from "../../lib/cu-osc-diamond-template/src/interfaces/IERC165.sol";
import {IResourceLocator} from "../interfaces/IResourceLocator.sol";

/// @title LG Resource Locator Library
/// @author rsampson@laguna.games
/// @notice Library for common LG Resource Locations deployed on a chain
/// @custom:storage-location erc7201:games.laguna.LibResourceLocator
library LibResourceLocator {
    //  @dev Storage slot for LG Resource addresses
    bytes32 internal constant RESOURCE_LOCATOR_SLOT_POSITION =
        keccak256(
            abi.encode(
                uint256(keccak256("games.laguna.LibResourceLocator")) - 1
            )
        ) & ~bytes32(uint256(0xff));

    struct ResourceLocatorStorageStruct {
        address unicornNFT; //  ERC-721
        address landNFT; //  ERC-721
        address shadowcornNFT; //  ERC-721
        address gemNFT; //  ERC-721
        address ritualNFT; //  ERC-721
        address RBWToken; //  ERC-20
        address CUToken; //  ERC-20
        address UNIMToken; //  ERC-20
        address WETHToken; //  ERC-20 (third party)
        address darkMarkToken; //  pseudo-ERC-20
        address unicornItems; //  ERC-1155 Terminus
        address shadowcornItems; //  ERC-1155 Terminus
        address accessControlBadge; //  ERC-1155 Terminus
        address gameBank;
        address satelliteBank;
        address playerProfile; //  PermissionProvider
        address shadowForge;
        address darkForest;
        address gameServerSSS; //  ERC-712 Signing Wallet
        address gameServerOracle; //  CU-Watcher
        address testnetDebugRegistry; // PermissionProvider
        address vrfOracle; //  SupraOracles VRF
        address vrfClientWallet; //  SupraOracles VRF payer
    }

    /// @notice Storage slot for ResourceLocator state data
    function resourceLocatorStorage()
        internal
        pure
        returns (ResourceLocatorStorageStruct storage storageSlot)
    {
        bytes32 position = RESOURCE_LOCATOR_SLOT_POSITION;

        // solhint-disable-next-line no-inline-assembly
        assembly {
            storageSlot.slot := position
        }
    }

    function unicornNFT() internal view returns (address) {
        return resourceLocatorStorage().unicornNFT;
    }

    function setUnicornNFT(address a) internal {
        resourceLocatorStorage().unicornNFT = a;
    }

    function landNFT() internal view returns (address) {
        return resourceLocatorStorage().landNFT;
    }

    function setLandNFT(address a) internal {
        resourceLocatorStorage().landNFT = a;
    }

    function shadowcornNFT() internal view returns (address) {
        return resourceLocatorStorage().shadowcornNFT;
    }

    function setShadowcornNFT(address a) internal {
        resourceLocatorStorage().shadowcornNFT = a;
    }

    function gemNFT() internal view returns (address) {
        return resourceLocatorStorage().gemNFT;
    }

    function setGemNFT(address a) internal {
        resourceLocatorStorage().gemNFT = a;
    }

    function ritualNFT() internal view returns (address) {
        return resourceLocatorStorage().ritualNFT;
    }

    function setRitualNFT(address a) internal {
        resourceLocatorStorage().ritualNFT = a;
    }

    function rbwToken() internal view returns (address) {
        return resourceLocatorStorage().RBWToken;
    }

    function setRBWToken(address a) internal {
        resourceLocatorStorage().RBWToken = a;
    }

    function cuToken() internal view returns (address) {
        return resourceLocatorStorage().CUToken;
    }

    function setCUToken(address a) internal {
        resourceLocatorStorage().CUToken = a;
    }

    function unimToken() internal view returns (address) {
        return resourceLocatorStorage().UNIMToken;
    }

    function setUNIMToken(address a) internal {
        resourceLocatorStorage().UNIMToken = a;
    }

    function wethToken() internal view returns (address) {
        return resourceLocatorStorage().WETHToken;
    }

    function setWETHToken(address a) internal {
        resourceLocatorStorage().WETHToken = a;
    }

    function darkMarkToken() internal view returns (address) {
        return resourceLocatorStorage().darkMarkToken;
    }

    function setDarkMarkToken(address a) internal {
        resourceLocatorStorage().darkMarkToken = a;
    }

    function unicornItems() internal view returns (address) {
        return resourceLocatorStorage().unicornItems;
    }

    function setUnicornItems(address a) internal {
        resourceLocatorStorage().unicornItems = a;
    }

    function shadowcornItems() internal view returns (address) {
        return resourceLocatorStorage().shadowcornItems;
    }

    function setShadowcornItems(address a) internal {
        resourceLocatorStorage().shadowcornItems = a;
    }

    function accessControlBadge() internal view returns (address) {
        return resourceLocatorStorage().accessControlBadge;
    }

    function setAccessControlBadge(address a) internal {
        resourceLocatorStorage().accessControlBadge = a;
    }

    function gameBank() internal view returns (address) {
        return resourceLocatorStorage().gameBank;
    }

    function setGameBank(address a) internal {
        resourceLocatorStorage().gameBank = a;
    }

    function satelliteBank() internal view returns (address) {
        return resourceLocatorStorage().satelliteBank;
    }

    function setSatelliteBank(address a) internal {
        resourceLocatorStorage().satelliteBank = a;
    }

    function playerProfile() internal view returns (address) {
        return resourceLocatorStorage().playerProfile;
    }

    function setPlayerProfile(address a) internal {
        resourceLocatorStorage().playerProfile = a;
    }

    function shadowForge() internal view returns (address) {
        return resourceLocatorStorage().shadowForge;
    }

    function setShadowForge(address a) internal {
        resourceLocatorStorage().shadowForge = a;
    }

    function darkForest() internal view returns (address) {
        return resourceLocatorStorage().darkForest;
    }

    function setDarkForest(address a) internal {
        resourceLocatorStorage().darkForest = a;
    }

    function gameServerSSS() internal view returns (address) {
        return resourceLocatorStorage().gameServerSSS;
    }

    function setGameServerSSS(address a) internal {
        resourceLocatorStorage().gameServerSSS = a;
    }

    function gameServerOracle() internal view returns (address) {
        return resourceLocatorStorage().gameServerOracle;
    }

    function setGameServerOracle(address a) internal {
        resourceLocatorStorage().gameServerOracle = a;
    }

    function testnetDebugRegistry() internal view returns (address) {
        return resourceLocatorStorage().testnetDebugRegistry;
    }

    function setTestnetDebugRegistry(address a) internal {
        resourceLocatorStorage().testnetDebugRegistry = a;
    }

    function vrfOracle() internal view returns (address) {
        return resourceLocatorStorage().vrfOracle;
    }

    function setVRFOracle(address a) internal {
        resourceLocatorStorage().vrfOracle = a;
    }

    function vrfClientWallet() internal view returns (address) {
        return resourceLocatorStorage().vrfClientWallet;
    }

    function setVRFClientWallet(address a) internal {
        resourceLocatorStorage().vrfClientWallet = a;
    }

    /// @notice Clones the addresses from an existing diamond onto this one
    function importResourcesFromDiamond(address diamond) internal {
        require(
            IERC165(diamond).supportsInterface(
                type(IResourceLocator).interfaceId
            ),
            "LibResourceLocator: target does not implement IResourceLocator"
        );
        IResourceLocator target = IResourceLocator(diamond);
        if (target.unicornNFTAddress() != address(0))
            setUnicornNFT(target.unicornNFTAddress());
        if (target.landNFTAddress() != address(0))
            setLandNFT(target.landNFTAddress());
        if (target.shadowcornNFTAddress() != address(0))
            setShadowcornNFT(target.shadowcornNFTAddress());
        if (target.gemNFTAddress() != address(0))
            setGemNFT(target.gemNFTAddress());
        if (target.ritualNFTAddress() != address(0))
            setRitualNFT(target.ritualNFTAddress());
        if (target.rbwTokenAddress() != address(0))
            setRBWToken(target.rbwTokenAddress());
        if (target.cuTokenAddress() != address(0))
            setCUToken(target.cuTokenAddress());
        if (target.unimTokenAddress() != address(0))
            setUNIMToken(target.unimTokenAddress());
        if (target.wethTokenAddress() != address(0))
            setWETHToken(target.wethTokenAddress());
        if (target.darkMarkTokenAddress() != address(0))
            setDarkMarkToken(target.darkMarkTokenAddress());
        if (target.unicornItemsAddress() != address(0))
            setUnicornItems(target.unicornItemsAddress());
        if (target.shadowcornItemsAddress() != address(0))
            setShadowcornItems(target.shadowcornItemsAddress());
        if (target.accessControlBadgeAddress() != address(0))
            setAccessControlBadge(target.accessControlBadgeAddress());
        if (target.gameBankAddress() != address(0))
            setGameBank(target.gameBankAddress());
        if (target.satelliteBankAddress() != address(0))
            setSatelliteBank(target.satelliteBankAddress());
        if (target.playerProfileAddress() != address(0))
            setPlayerProfile(target.playerProfileAddress());
        if (target.shadowForgeAddress() != address(0))
            setShadowForge(target.shadowForgeAddress());
        if (target.darkForestAddress() != address(0))
            setDarkForest(target.darkForestAddress());
        if (target.gameServerSSSAddress() != address(0))
            setGameServerSSS(target.gameServerSSSAddress());
        if (target.gameServerOracleAddress() != address(0))
            setGameServerOracle(target.gameServerOracleAddress());
        if (target.testnetDebugRegistryAddress() != address(0))
            setTestnetDebugRegistry(target.testnetDebugRegistryAddress());
        if (target.vrfOracleAddress() != address(0))
            setVRFOracle(target.vrfOracleAddress());
        if (target.vrfClientWalletAddress() != address(0))
            setVRFClientWallet(target.vrfClientWalletAddress());
    }
}
