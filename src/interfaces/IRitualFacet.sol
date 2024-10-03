// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {LibRitualComponents} from '../libraries/LibRitualComponents.sol';
import {LibConstraints} from '../libraries/LibConstraints.sol';
import {LibRitualData} from '../libraries/LibRitualData.sol';

interface IRitualFacet {
    /// @notice This function creates a ritual and mints it to the target user,
    /// can only be called by minion hatchery.
    /// @param to The user that the ritual should be minted to.
    /// @param name The ritual's name.
    /// @param rarity The ritual's rarity expressed in integer value.
    /// @param costs The costs to pay to consume a ritual charge expressed in components.
    /// @param products The outcome of consuming a ritual charge expressed in components.
    /// @param constraints The restrictions to consume a ritual charge expressed in constraints.
    /// @param charges The amount of times the ritual can consume a charge to exchange costs for products.
    /// @param soulbound Flag to indicate if the ritual is soulbound or not.
    function createRitual(
        address to,
        string calldata name,
        uint8 rarity,
        LibRitualComponents.RitualCost[] memory costs,
        LibRitualComponents.RitualProduct[] memory products,
        LibConstraints.Constraint[] memory constraints,
        uint256 charges,
        bool soulbound
    ) external returns (uint256 ritualTokenId);

    /// @notice This function returns the entire ritual data that is relevant for the minion hatchery.
    /// @param ritualId The id of the ritual.
    /// @return Ritual (name, rarity, costs, products, constraints, charges and soulbound).
    function getRitualDetails(uint256 ritualId) external view returns (LibRitualData.Ritual memory);

    /// @notice This function consumes a ritual charge, can only be called by minion hatchery.
    /// @param ritualId The id of the ritual.
    function consumeRitualCharge(uint256 ritualId) external;

    /// @notice This function validates checks that the address that wants to consume a charge
    /// is the owner of the ritual and that is has charges left, then
    /// returns the ritual details, can only be called by minion hatchery.
    /// @param ritualId The id of the ritual.
    /// @param ritualOwner The owner of the ritual.
    /// @return Ritual (name, rarity, costs, products, constraints, charges and soulbound).
    function validateChargesAndGetRitualDetailsForConsume(
        uint256 ritualId,
        address ritualOwner
    ) external view returns (LibRitualData.Ritual memory);

    /// @notice This function returns the maximum amount of charges a ritual can have.
    /// @param ritualId The id of the ritual.
    /// @return The maximum amount of charges.
    function getMaxChargesByRitualId(uint256 ritualId) external view returns (uint256);

    /// @notice This function burns rituals and deletes the max charges for them.
    /// @param ritualId The id of the ritual.
    function recycleRitualCharges(uint256 ritualId) external;
}
