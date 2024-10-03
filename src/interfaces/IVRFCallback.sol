// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.19;

// import {LibRNG} from '../../lib/@lagunagames/cu-common/src/libraries/LibRNG.sol';

interface IVRFCallback {
    /// @notice Callback for VRF fulfillRandomness
    /// @dev This method MUST check `LibRNG.rngReceived(nonce)`
    /// @dev For multiple RNG callbacks, copy and rename this function
    /// @custom:see https://gb-docs.supraoracles.com/docs/vrf/v2-guide
    /// @param nonce The vrfRequestId
    /// @param rngList The random numbers
    function fulfillRandomness(
        uint256 nonce,
        uint256[] calldata rngList
    ) external; /* {
        LibRNG.rngReceived(nonce);
        // ...
    } //*/
}
