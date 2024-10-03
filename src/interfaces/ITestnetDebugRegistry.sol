// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Testnet Registry Interface
/// @dev The ERC-165 identifier for this interface is 0x5c9b87cc
/// @dev https://github.com/Laguna-Games/cu-bcv2-debug-registry
/// @author rsampson@laguna.games
interface ITestnetDebugRegistry {
    struct Role {
        bool existsInSystem;
        bool admin;
        bool debugger;
        bool banned;
    }

    /// @notice Throws an error if the target account is not an Admin
    /// @dev In most cases, this is the only call needed to guard config debug endpoints.
    /// @param account Wallet to check
    /// @custom:throws GlobalDebuggingDisabled
    /// @custom:throws AddressIsBanned
    /// @custom:throws AddressIsNotAdmin
    function enforceAdmin(address account) external view;

    /// @notice Throws an error if the target account is not a Debugger (or Admin)
    /// @dev In most cases, this is the only call needed to guard debug endpoints.
    /// @param account Wallet to check
    /// @custom:throws GlobalDebuggingDisabled
    /// @custom:throws AddressIsBanned
    /// @custom:throws AddressIsNotDebugger
    function enforceDebugger(address account) external view;

    /// @notice Throws an error if global debugging is not enabled
    /// @dev This is automatically checked by enforceAdmin and enforceDebugger
    /// @custom:throws GlobalDebuggingDisabled
    function enforceGlobalDebuggingEnabled() external view;

    /// @notice Global debugging state on the entire testnet
    /// @return enabled true if global debugging is enabled
    function globalDebuggingEnabled() external view returns (bool enabled);

    /// @notice Return the permissions for an account
    /// @param account Wallet to check
    /// @return role Current permissions for the account
    function role(address account) external view returns (Role memory);

    /// @notice Return if the current chainid is a known mainnet
    /// @return isMainnet True if the current chainid is a known mainnet
    function isMainnet() external view returns (bool);

    /// @notice Return if the current chainid is a known testnet
    /// @return isTestnet True if the current chainid is a known testnet
    function isTestnet() external view returns (bool);

    /// @notice Throws an error if the current chainid is not a known mainnet
    /// @notice This check is not necessary if globalDebugging is enabled
    /// @custom:throws InvalidBlockchain
    function enforceTestnet() external view;

    /// @notice Throws an error if the target account is banned
    /// @dev This is checked automatically by other enforce calls
    /// @param account Wallet to check
    /// @custom:throws GlobalDebuggingDisabled
    /// @custom:throws AddressIsBanned
    function enforceNotBanned(address account) external view;

    /// @notice Return if the target account is an Admin
    /// @param account Wallet to check
    /// @return isAdmin True if the target account is an Admin
    function isAdmin(address account) external view returns (bool);

    /// @notice Return if the target account is a Debugger
    /// @param account Wallet to check
    /// @return isDebugger True if the target account is a Debugger
    function isDebugger(address account) external view returns (bool);

    /// @notice Return if the target account is banned
    /// @param account Wallet to check
    /// @return isBanned True if the target account is banned
    function isBanned(address account) external view returns (bool);
}
