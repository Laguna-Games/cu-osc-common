// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

/*
    @title LibRitualValidate
    @dev This library has methods to validate rituals
 */
library LibRitualValidate {
    /*
        @title Enforces ritual is valid
        @author Facundo Vidal
        @dev This function is called to ensure that the ritual is valid
        Reverts if the ritual is invalid
        @param _name The name of the ritual
        @param _rarity The rarity of the ritual
        @param _charges The charges of the ritual
     */
    function enforceValidRitual(string memory _name,
        uint8 _rarity,
        uint256 _charges) internal pure {
        // Check if name is valid
        require(bytes(_name).length > 0, "LibRitualValidate: invalid name");
        // Check if rarity is valid
        require(_rarity >= 1 && _rarity <= 3, "LibRitualValidate: invalid rarity"); // 1=MYTHIC, 2=RARE, 3=COMMON
        // Check if charges is valid
        require(_charges > 0, "LibRitualValidate: invalid charges");
    }
}