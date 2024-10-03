// Copyright 2021-2022, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title Lookup for basic info about accounts and contracts.
/// @notice Precompiled contract that exists in every Arbitrum chain at 0x0000000000000000000000000000000000000065.
/// @custom:see https://docs.arbitrum.io/build-decentralized-apps/precompiles/reference
/// @custom:see https://github.com/OffchainLabs/nitro-contracts/blob/1cab72ff3dfcfe06ceed371a9db7a54a527e3bfb/src/precompiles/ArbInfo.sol
interface IArbInfo {
    /// @notice Retrieves an account's balance
    function getBalance(address account) external view returns (uint256);

    /// @notice Retrieves a contract's deployed code
    function getCode(address account) external view returns (bytes memory);
}
