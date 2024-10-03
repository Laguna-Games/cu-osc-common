//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;
import {LibContractOwner} from "../../lib/cu-osc-diamond-template/src/libraries/LibContractOwner.sol";
import {LibGasReturner} from "../libraries/LibGasReturner.sol";

contract GasReturnerFacet {
    function setMaxGasReturnedPerTransaction(
        string[] memory transactionTypes,
        uint256[] memory maxGasReturned
    ) external {
        LibContractOwner.enforceIsContractOwner();
        LibGasReturner.setMaxGasReturnedPerTransaction(
            transactionTypes,
            maxGasReturned
        );
    }

    function getMaxGasReturnedPerTransaction(
        string memory transactionType
    ) external view returns (uint256) {
        return LibGasReturner.getMaxGasReturnedPerTransaction(transactionType);
    }
}
