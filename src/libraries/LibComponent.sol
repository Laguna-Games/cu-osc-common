// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @author Ignacio Borovsky
library LibComponent {
    struct Component {
        uint256 amount;
        uint128 assetType;
        uint128 poolId;
        address asset;
    }

    enum TransferType {
        NONE,
        MINT_BURN,
        TRANSFER
    }

    struct Cost {
        Component component;
        TransferType transferType;
    }
}
