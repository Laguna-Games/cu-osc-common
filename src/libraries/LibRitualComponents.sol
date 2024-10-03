// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

library LibRitualComponents {

    /// @notice Components are the costs and products of the rituals
    //  both share the same format, a component can be either a cost or a product.
    //  @param amount The amount of a certain asset (applies for erc20 and 1155)
    //  @param assetType The ERC type 20 = ERC20, 721 = ERC721, 1155 = ERC1155
    //  @param asset The address of the asset
    //  @param poolId The poolId of the ERC1155 asset (only applies in that case)
    struct RitualComponent {
        uint256 amount;
        uint128 assetType;         
        uint128 poolId;  
        address asset;              
    }

    // @notice This enum contains the different transfer types for costs.
    enum RitualCostTransferType {
        NONE,
        BURN,
        TRANSFER
    }

    // @notice This enum contains the different transfer types for products.
    enum RitualProductTransferType {
        NONE,
        MINT,
        TRANSFER
    }

    // @notice RitualCosts contain components and transfer types for the costs themselves.
    // @param component The component of the cost.
    // @param transferType The transfer type of the cost.
    struct RitualCost {
        RitualComponent component;
        RitualCostTransferType transferType;
    }

    // @notice RitualProducts contain components and transfer types for the products themselves.
    // @param component The component of the product.
    // @param transferType The transfer type of the product.
    struct RitualProduct {
        RitualComponent component;
        RitualProductTransferType transferType;
    }
}