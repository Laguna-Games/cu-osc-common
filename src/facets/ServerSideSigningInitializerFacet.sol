// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {LibServerSideSigning} from "../libraries/LibServerSideSigning.sol";
import {LibContractOwner} from "../../lib/cu-osc-diamond-template/src/libraries/LibContractOwner.sol";

/// @title SSS Initializer facet for Crypto Unicorns
/// @author rsampson@laguna.games
contract ServerSideSigningInitializerFacet {
    /// @notice Initialize the EIP712 parameters
    /// @param name The name of the DApp (ex. "Crypto Unicorns Land")
    /// @param version The current version of the signing domain (ex. "0.0.1")
    function initializeSSS(string memory name, string memory version) external {
        LibContractOwner.enforceIsContractOwner();
        LibServerSideSigning._setEIP712Parameters(name, version);
    }
}
