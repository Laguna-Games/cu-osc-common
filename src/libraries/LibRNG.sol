// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {ISupraRouter} from '../interfaces/ISupraRouter.sol';
import {LibResourceLocator} from '../libraries/LibResourceLocator.sol';
import {LibEnvironment} from '../libraries/LibEnvironment.sol';

/// @custom:see https://gb-docs.supraoracles.com/docs/vrf/v2-guide
/// @custom:storage-location erc7201:CryptoUnicorns.RNG.storage
library LibRNG {
    bytes32 constant RNG_STORAGE_POSITION =
        keccak256(abi.encode(uint256(keccak256('CryptoUnicorns.RNG.storage')) - 1)) & ~bytes32(uint256(0xff));

    uint256 private constant CONFIRMATION_BLOCKS = 1;

    struct RNGStorage {
        // Nonce used for on-chain RNG
        uint256 rngNonce;
        //  Duration in blocks for VRF to respond with randomness
        uint16 blocksToRespond; //  Leave this `0` for unlimited TTL
        //  The wallet used to pay for Supra RNG requests (docs call this "client wallet")
        address supraClientWallet;
        //  The block number when a request was made
        mapping(uint256 vrfRequestId => uint256 blockNumber) blockRequested;
    }

    function rngStorage() internal pure returns (RNGStorage storage rs) {
        bytes32 position = RNG_STORAGE_POSITION;
        assembly {
            rs.slot := position
        }
    }

    function requestRandomness(string memory callbackSignature) internal returns (uint256 vrfRequestId) {
        RNGStorage storage rs = rngStorage();
        vrfRequestId = ISupraRouter(LibResourceLocator.vrfOracle()).generateRequest(
            callbackSignature,
            1, // random number count
            CONFIRMATION_BLOCKS,
            rs.supraClientWallet
        );
        rs.blockRequested[vrfRequestId] = LibEnvironment.getBlockNumber();
    }

    /// @notice Validate and store the randomness received from a VRF callback
    /// @dev All VRF callbacks MUST call this function
    function rngReceived(uint256 vrfRequestId) internal {
        RNGStorage storage rs = rngStorage();
        enforceCallerIsVRFRouter();

        require(rs.blockRequested[vrfRequestId] > 0, 'RNG: Request invalid or already fulfilled');

        if (rs.blocksToRespond > 0) {
            require(
                LibEnvironment.getBlockNumber() <= rs.blockRequested[vrfRequestId] + rs.blocksToRespond,
                'RNG: Request TTL expired'
            );
        }

        delete rngStorage().blockRequested[vrfRequestId];
    }

    /// @notice Ensures that the caller is the VRF Router, or reverts.
    function enforceCallerIsVRFRouter() internal view {
        require(msg.sender == LibResourceLocator.vrfOracle(), 'RNG: VRFRouter only');
    }

    function expand(uint256 _modulus, uint256 _seed, uint256 _salt) internal pure returns (uint256) {
        return uint256(keccak256(abi.encode(_seed, _salt))) % _modulus;
    }

    //  Generates a pseudo-random integer. This is the cheapestbut least secure.
    //  @return Random integer in the range of [0-_modulus)
    function getCheapRNG(uint _modulus) internal returns (uint256) {
        return uint256(keccak256(abi.encode(++rngStorage().rngNonce))) % _modulus;
    }

    function getRuntimeRNG() internal returns (uint256) {
        return getRuntimeRNG(type(uint256).max);
    }

    /// @notice Generates a pseudo-random integer. This is cheaper than VRF but less secure.
    /// The rngNonce seed should be rotated by VRF before using this pRNG.
    /// @custom:see https://www.geeksforgeeks.org/random-number-generator-in-solidity-using-keccak256/
    /// @custom:see https://docs.chain.link/docs/chainlink-vrf-best-practices/
    /// @param _modulus The range of the response (exclusive)
    /// @return Random integer in the range of [0-_modulus)
    function getRuntimeRNG(uint _modulus) internal returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.coinbase,
                        gasleft(),
                        LibEnvironment.getBlockNumber(),
                        ++rngStorage().rngNonce
                    )
                )
            ) % _modulus;
    }
}
