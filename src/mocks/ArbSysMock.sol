// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {IArbInfo} from '../interfaces/IArbInfo.sol';

/*
 * @dev ArbSysMock is a mock contract for the ArbSys interface that exists on all the Arbitrum chains.
 * It's used to mock the pre-compiled stateless contract on the Foundry EVM while running scripts and tests.
 */
contract ArbSysMock {
    function arbChainID() external view returns (uint256) {
        return block.chainid;
    }

    function arbBlockNumber() external view returns (uint256) {
        return block.number;
    }
}

contract ArbInfoMock is IArbInfo {
    /// @notice Retrieves an account's balance
    function getBalance(address account) external view returns (uint256) {
        return address(account).balance;
    }

    /// @notice Retrieves a contract's deployed code
    function getCode(address account) external view returns (bytes memory) {
        return account.code;
    }
}
