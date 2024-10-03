// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

interface IUnicornBurn {
    function batchSacrificeUnicorns(uint256[] memory tokenIds, address owner) external;

    function batchBurnFrom(uint256[] memory tokenIds, address owner) external;
}
