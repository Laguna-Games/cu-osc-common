// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

library LibConstraints {

    /// @notice This Constraints are used to check if the user meets 
    //  certain requirements to mint rituals or consume charges from 
    //  a ritual in the minion hatchery
    //  @param constraintType What will the constraint check against
    //  @param operator The conditional operator that will be checked against the constraintType
    //  @param value The value that will be checked with the operator against the constraintType
    struct Constraint {
        uint128 constraintType;
        uint128 operator;
        uint256 value;
    }

    //DO NOT REORDER THIS VALUES
    enum ConstraintType {
        NONE,                           //0
        HATCHERY_LEVEL,                 //1
        SHADOWCORN_RARITY,              //2
        SHADOWCORN_CLASS,               //3
        SHADOWCORN_BALANCE,             //4
        SHADOWCORN_MIGHT,               //5
        SHADOWCORN_WICKEDNESS,          //6
        SHADOWCORN_TENACITY,            //7
        SHADOWCORN_CUNNING,             //8
        SHADOWCORN_ARCANA,              //9
        BALANCE_UNICORN,                //10
        BALANCE_SHADOWCORN              //11
    }

    // @notice This function is used to check if a constraint type is valid.
    // @param constraintType The constraint type to check.
    function enforceValidConstraintType(uint256 constraintType) internal pure {
        require(constraintType <= uint(type(ConstraintType).max), "LibConstraints: invalid constraint type.");
    }
}