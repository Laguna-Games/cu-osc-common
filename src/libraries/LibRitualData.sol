//  SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {LibRitualComponents} from "../libraries/LibRitualComponents.sol";
import {LibConstraints} from "../libraries/LibConstraints.sol";

library LibRitualData {
    ///   @dev Basic rituals just hold basic data in order to easily handle the storage.
    ///   @param name The ritual's name
    ///   @param rarity The ritual's rarity expressed in integer value.
    ///   @param charges The amount of times the ritual can consume a charge to exchange costs for products.
    ///   @param soulbound Flag to indicate if the ritual is soulbound or not.
    struct BasicRitual {
        string name;
        uint8 rarity;
        uint256 charges;
        bool soulbound;
    }

    ///   @dev Rituals are the return data type, they hold the entire storage in a single struct.
    ///   @param name The ritual's name
    ///   @param rarity The ritual's rarity expressed in integer value.
    ///   @param costs The costs to pay to consume a ritual charge expressed in components.
    ///   @param products The outcome of consuming a ritual charge expressed in components.
    ///   @param constraints The restrictions to consume a ritual charge expressed in constraints.
    ///   @param charges The amount of times the ritual can consume a charge to exchange costs for products.
    ///   @param soulbound Flag to indicate if the ritual is soulbound or not.
    struct Ritual {
        string name;
        uint8 rarity;
        LibRitualComponents.RitualCost[] costs; 
        LibRitualComponents.RitualProduct[] products; 
        LibConstraints.Constraint[] constraints;
        uint256 charges;
        bool soulbound;
    }
}
 