// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.19;

/// @custom:see https://gb-docs.supraoracles.com/docs/vrf/v2-guide
interface ISupraRouter {
    function generateRequest(
        string memory _functionSig,
        uint8 _rngCount,
        uint256 _numConfirmations,
        uint256 _clientSeed,
        address _clientWalletAddress
    ) external returns (uint256);

    function generateRequest(
        string memory _functionSig,
        uint8 _rngCount,
        uint256 _numConfirmations,
        address _clientWalletAddress
    ) external returns (uint256);
}
