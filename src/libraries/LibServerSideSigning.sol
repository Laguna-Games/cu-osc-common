// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {LibEnvironment} from './LibEnvironment.sol';

/**
 * Much of the functionality in this library is adapted from OpenZeppelin's EIP712 implementation:
 * https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/draft-EIP712.sol
 *
 * This is a duplication/adaptation of the original LibServerSideSigning implemented in the Unicorn
 * repository. If possible the two implementations should be kept in synchronization (or factored into
 * a common codebase).
 */

import {ECDSA} from '../../lib/openzeppelin-contracts/contracts/utils/cryptography/ECDSA.sol';

/// @title Server Side Signing Library
/// @notice This library is used to manage server side signing for the game bank.
/// @custom:storage-location erc7201:cryptounicorns.serversidesigning.storage
library LibServerSideSigning {
    /// @dev storage slot for the game bank storage.
    bytes32 internal constant SERVER_SIDE_SIGNING_STORAGE_POSITION =
        keccak256(abi.encode(uint256(keccak256('cryptounicorns.serversidesigning.storage')) - 1)) &
            ~bytes32(uint256(0xff));

    struct ServerSideSigningStorage {
        string name;
        string version;
        bytes32 CACHED_DOMAIN_SEPARATOR;
        uint256 CACHED_CHAIN_ID;
        bytes32 HASHED_NAME;
        bytes32 HASHED_VERSION;
        bytes32 TYPE_HASH;
        mapping(uint256 => bool) completedRequests;
    }

    function serverSideSigningStorage() internal pure returns (ServerSideSigningStorage storage ss) {
        bytes32 position = SERVER_SIDE_SIGNING_STORAGE_POSITION;
        assembly {
            ss.slot := position
        }
    }

    function _buildDomainSeparator(
        bytes32 typeHash,
        bytes32 nameHash,
        bytes32 versionHash
    ) internal view returns (bytes32) {
        return keccak256(abi.encode(typeHash, nameHash, versionHash, LibEnvironment.chainId(), address(this)));
    }

    function _setEIP712Parameters(string memory name, string memory version) internal {
        ServerSideSigningStorage storage ss = serverSideSigningStorage();
        ss.name = name;
        ss.version = version;
        bytes32 hashedName = keccak256(bytes(name));
        bytes32 hashedVersion = keccak256(bytes(version));
        bytes32 typeHash = keccak256(
            'EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'
        );
        ss.HASHED_NAME = hashedName;
        ss.HASHED_VERSION = hashedVersion;
        ss.CACHED_CHAIN_ID = LibEnvironment.chainId();
        ss.CACHED_DOMAIN_SEPARATOR = _buildDomainSeparator(typeHash, hashedName, hashedVersion);
        ss.TYPE_HASH = typeHash;
    }

    function _domainSeparatorV4() internal view returns (bytes32) {
        ServerSideSigningStorage storage ss = serverSideSigningStorage();
        if (LibEnvironment.chainId() == ss.CACHED_CHAIN_ID) {
            return ss.CACHED_DOMAIN_SEPARATOR;
        } else {
            return _buildDomainSeparator(ss.TYPE_HASH, ss.HASHED_NAME, ss.HASHED_VERSION);
        }
    }

    function _hashTypedDataV4(bytes32 structHash) internal view returns (bytes32) {
        return ECDSA.toTypedDataHash(_domainSeparatorV4(), structHash);
    }

    function _completeRequest(uint256 requestId) internal {
        ServerSideSigningStorage storage ss = serverSideSigningStorage();
        ss.completedRequests[requestId] = true;
    }

    function _clearRequest(uint256 requestId) internal {
        ServerSideSigningStorage storage ss = serverSideSigningStorage();
        ss.completedRequests[requestId] = false;
    }

    function _checkRequest(uint256 requestId) internal view returns (bool) {
        ServerSideSigningStorage storage ss = serverSideSigningStorage();
        return ss.completedRequests[requestId];
    }
}
