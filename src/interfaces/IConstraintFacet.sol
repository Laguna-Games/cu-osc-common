// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import {LibConstraints} from '../libraries/LibConstraints.sol';

interface IConstraintFacet {
    /// @notice Check if constraint for an owner is met
    /// @dev This uses @lg-commons/LibConstraintOperator to check.
    /// @param owner The owner to check
    /// @param constraint The constraint to check, must be one of the constraint types and operators defined in @lg-commons/LibConstraintOperator
    /// @return isMet True if the constraint is met, false otherwise
    function checkConstraint(address owner, LibConstraints.Constraint memory constraint) external view returns (bool);

    /// @notice Check if constraint for an owner or for the extraTokens is met
    /// @dev This uses @lg-commons/LibConstraintOperator to check.
    /// @param owner Will check if the constraint is met any tokens owned by this address
    /// @param constraint The constraint to check, must be one of the constraint types and operators defined in @lg-commons/LibConstraintOperator
    /// @param extraTokenIdsToCheck Will check if the constraint is met for these extra token ids
    /// @return isMet True if the constraint is met, false otherwise
    function checkConstraintForUserAndExtraTokens(
        address owner,
        LibConstraints.Constraint memory constraint,
        uint256[] memory extraTokenIdsToCheck
    ) external view returns (bool);
}
