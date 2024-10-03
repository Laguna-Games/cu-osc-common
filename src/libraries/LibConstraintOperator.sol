// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

library LibConstraintOperator {
    //DO NOT REORDER THIS VALUES
    enum ConstraintOperator {
        NONE, //0
        LESS_THAN, //1 (<)
        LESS_THAN_OR_EQUAL, //2 (<=)
        EQUAL, //3 (=)
        GREATER_THAN_OR_EQUAL, //4 (>=)
        GREATER_THAN, //5 (>)
        NOT_EQUAL //6 (!=)
    }

    /*
        @title Enforce valid operator
        @notice This function will revert if the operator is not valid
        @param operator The operator to check
     */
    function enforceValidOperator(uint256 operator) internal pure {
        require(operator <= uint(type(ConstraintOperator).max), 'LibConstraintOperator: invalid constraint operator.');
    }

    /*
        @title Check mathematical operator against two values
        @notice This function will return whether the condition for the mathematical operator and the given values is true or false.
        @dev This function will revert if the operator is NONE or not valid.
        @param leftValue The first value that we need to compare with the other value parameter for the given mathematical operator.
        @param operator The operator to check (=, >, <, >=, <=, !=)
        @param rightValue The second value to check
        @return bool Whether the operator condition for the given values is true or false.
     */
    function checkOperator(uint256 leftValue, uint256 operator, uint256 rightValue) internal pure returns (bool) {
        enforceValidOperator(operator);

        ConstraintOperator castedOperator = ConstraintOperator(operator);
        require(castedOperator != ConstraintOperator.NONE, 'LibConstraintOperator: Operator should not be NONE.');

        if (castedOperator == ConstraintOperator.LESS_THAN) {
            return leftValue < rightValue;
        }
        if (castedOperator == ConstraintOperator.LESS_THAN_OR_EQUAL) {
            return leftValue <= rightValue;
        }
        if (castedOperator == ConstraintOperator.EQUAL) {
            return leftValue == rightValue;
        }
        if (castedOperator == ConstraintOperator.GREATER_THAN_OR_EQUAL) {
            return leftValue >= rightValue;
        }
        if (castedOperator == ConstraintOperator.GREATER_THAN) {
            return leftValue > rightValue;
        }
        if (castedOperator == ConstraintOperator.NOT_EQUAL) {
            return leftValue != rightValue;
        }

        revert('LibConstraintOperator: Invalid operator.');
    }
}
