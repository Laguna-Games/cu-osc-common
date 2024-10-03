// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

/// @custom:storage-location erc7201:games.laguna.LibGasReturner
library LibGasReturner {
    event GasReturnedToUser(
        uint256 amountReturned,
        uint256 txPrice,
        uint256 gasSpent,
        address indexed user,
        bool indexed success,
        string indexed transactionType
    );

    event GasReturnerMaxGasReturnedPerTransactionChanged(
        uint256 oldMaxGasReturnedPerTransaction,
        uint256 newMaxGasReturnedPerTransaction,
        address indexed admin
    );

    event GasReturnerInsufficientBalance(
        uint256 txPrice,
        uint256 gasSpent,
        address indexed user,
        string indexed transactionType
    );

    bytes32 internal constant LIB_GAS_RETURNER_STORAGE_POSITION =
        keccak256(abi.encode(uint256(keccak256('games.laguna.LibGasReturner')) - 1)) & ~bytes32(uint256(0xff));

    struct LibGasReturnerStorage {
        mapping(string transactionType => uint256 maxGasReturnedPerTransaction) maxGasReturnedPerTransactionType; // in wei, not gas units
    }

    function gasReturnerStorage() internal pure returns (LibGasReturnerStorage storage lgrs) {
        bytes32 position = LIB_GAS_RETURNER_STORAGE_POSITION;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            lgrs.slot := position
        }
    }

    function returnGasToUser(string memory transactionType, uint256 gasSpent, address payable user) internal {
        uint256 maxGasReturned = getMaxGasReturnedPerTransaction(transactionType);

        if (maxGasReturned == 0) {
            return;
        }

        uint256 totalToReturn = gasSpent * tx.gasprice;

        if (totalToReturn > maxGasReturned) {
            totalToReturn = maxGasReturned;
        }

        if (address(this).balance < totalToReturn) {
            // Emit event for monitoring
            emit GasReturnerInsufficientBalance(tx.gasprice, gasSpent, user, transactionType);
            return;
        }

        (bool sent, ) = user.call{value: totalToReturn}('');

        emit GasReturnedToUser(totalToReturn, tx.gasprice, gasSpent, user, sent, transactionType);
    }

    function setMaxGasReturnedPerTransaction(
        string[] memory transactionType,
        uint256[] memory maxGasReturned
    ) internal {
        require(transactionType.length == maxGasReturned.length, 'GR-001');

        require(transactionType.length > 0, 'GR-002');

        for (uint256 i = 0; i < transactionType.length; ++i) {
            require(bytes(transactionType[i]).length > 0, 'GR-003');

            emit GasReturnerMaxGasReturnedPerTransactionChanged(
                gasReturnerStorage().maxGasReturnedPerTransactionType[transactionType[i]],
                maxGasReturned[i],
                msg.sender
            );

            gasReturnerStorage().maxGasReturnedPerTransactionType[transactionType[i]] = maxGasReturned[i];
        }
    }

    function getMaxGasReturnedPerTransaction(string memory transactionType) internal view returns (uint256) {
        return gasReturnerStorage().maxGasReturnedPerTransactionType[transactionType];
    }
}
