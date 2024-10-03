// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {LibContractOwner} from "../../lib/cu-osc-diamond-template/src/libraries/LibContractOwner.sol";
import {ITestnetDebugRegistry} from "../interfaces/ITestnetDebugRegistry.sol";
import {LibResourceLocator} from "./LibResourceLocator.sol";

/// @title Helper Library for using the LG Testnet Debug Diamond
/// @author rsampson@laguna.games
/// @dev The TestnetDebugRegistry is a stand-alone Diamond contract that keeps track
/// @dev of admin and debug permissions for all LG contracts on the testnet.
/// @dev This library can be used to check permissions on the registry.
/// @dev https://github.com/Laguna-Games/cu-bcv2-debug-registry
/// @custom:storage-location erc7201:games.laguna.LibTestnetDebugRegistry
library LibTestnetDebugInterface {
    /// @notice Throws an error if the target account is not an Admin
    /// @dev In most cases, this is the only call needed to guard config debug endpoints.
    function enforceAdmin() internal view {
        if (msg.sender != LibContractOwner.contractOwner()) {
            ITestnetDebugRegistry registry = ITestnetDebugRegistry(
                LibResourceLocator.testnetDebugRegistry()
            );
            registry.enforceAdmin(msg.sender);
        }
    }

    /// @notice Throws an error if the target account is not a Debugger (or Admin)
    /// @dev In most cases, this is the only call needed to guard debug endpoints.
    function enforceDebugger() internal view {
        if (msg.sender != LibContractOwner.contractOwner()) {
            ITestnetDebugRegistry registry = ITestnetDebugRegistry(
                LibResourceLocator.testnetDebugRegistry()
            );
            registry.enforceDebugger(msg.sender);
        }
    }

    /// @notice Throws an error if global debugging is not enabled
    /// @dev This is automatically checked by enforceAdmin and enforceDebugger
    function enforceGlobalDebuggingEnabled() internal view {
        if (msg.sender != LibContractOwner.contractOwner()) {
            ITestnetDebugRegistry registry = ITestnetDebugRegistry(
                LibResourceLocator.testnetDebugRegistry()
            );
            registry.enforceGlobalDebuggingEnabled();
        }
    }

    /// @notice Global debugging state on the entire testnet
    /// @return enabled true if global debugging is enabled
    function globalDebuggingEnabled() internal view returns (bool enabled) {
        ITestnetDebugRegistry registry = ITestnetDebugRegistry(
            LibResourceLocator.testnetDebugRegistry()
        );
        return registry.globalDebuggingEnabled();
    }

    /// @notice Return the permissions for an account
    /// @param account Wallet to check
    /// @return role Current permissions for the account
    function role(
        address account
    ) external view returns (ITestnetDebugRegistry.Role memory) {
        ITestnetDebugRegistry registry = ITestnetDebugRegistry(
            LibResourceLocator.testnetDebugRegistry()
        );
        return registry.role(account);
    }

    /// @notice Return if the current chainid is a known mainnet
    /// @return isMainnet True if the current chainid is a known mainnet
    function isMainnet() internal view returns (bool) {
        ITestnetDebugRegistry registry = ITestnetDebugRegistry(
            LibResourceLocator.testnetDebugRegistry()
        );
        return registry.isMainnet();
    }

    /// @notice Return if the current chainid is a known testnet
    /// @return isTestnet True if the current chainid is a known testnet
    function isTestnet() internal view returns (bool) {
        ITestnetDebugRegistry registry = ITestnetDebugRegistry(
            LibResourceLocator.testnetDebugRegistry()
        );
        return registry.isTestnet();
    }

    /// @notice Throws an error if the current chainid is not a known mainnet
    /// @notice This check is not necessary if globalDebugging is enabled
    function enforceTestnet() internal view {
        ITestnetDebugRegistry registry = ITestnetDebugRegistry(
            LibResourceLocator.testnetDebugRegistry()
        );
        registry.enforceTestnet();
    }

    /// @notice Throws an error if the target account is banned
    /// @dev This is checked automatically by other enforce calls
    function enforceNotBanned() internal view {
        if (msg.sender != LibContractOwner.contractOwner()) {
            ITestnetDebugRegistry registry = ITestnetDebugRegistry(
                LibResourceLocator.testnetDebugRegistry()
            );
            registry.enforceNotBanned(msg.sender);
        }
    }

    /// @notice Return if the target account is an Admin
    /// @param account Wallet to check
    /// @return isAdmin True if the target account is an Admin
    function isAdmin(address account) internal view returns (bool) {
        if (account == LibContractOwner.contractOwner()) return true;
        ITestnetDebugRegistry registry = ITestnetDebugRegistry(
            LibResourceLocator.testnetDebugRegistry()
        );
        return registry.isAdmin(account);
    }

    /// @notice Return if the target account is a Debugger
    /// @param account Wallet to check
    /// @return isDebugger True if the target account is a Debugger
    function isDebugger(address account) internal view returns (bool) {
        if (account == LibContractOwner.contractOwner()) return true;
        ITestnetDebugRegistry registry = ITestnetDebugRegistry(
            LibResourceLocator.testnetDebugRegistry()
        );
        return registry.isDebugger(account);
    }

    /// @notice Return if the target account is banned
    /// @param account Wallet to check
    /// @return isBanned True if the target account is banned
    function isBanned(address account) internal view returns (bool) {
        ITestnetDebugRegistry registry = ITestnetDebugRegistry(
            LibResourceLocator.testnetDebugRegistry()
        );
        return registry.isBanned(account);
    }
}
