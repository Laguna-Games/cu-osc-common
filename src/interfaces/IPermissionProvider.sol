// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IPermissionProvider {

    enum Permission {               // WARNING: This list must NEVER be re-ordered
        FARM_ALLOWED,                                                   //0
        JOUST_ALLOWED,              //  Not in use yet                  //1
        RACE_ALLOWED,               //  Not in use yet                  //2
        PVP_ALLOWED,                //  Not in use yet                  //3
        UNIGATCHI_ALLOWED,          //  Not in use yet                  //4
        RAINBOW_RUMBLE_ALLOWED,     //  Not in use yet                  //5
        UNICORN_PARTY_ALLOWED,      //  Not in use yet                  //6

        UNICORN_BREEDING_ALLOWED,                                       //7
        UNICORN_HATCHING_ALLOWED,                                       //8
        UNICORN_EVOLVING_ALLOWED,                                       //9
        UNICORN_AIRLOCK_IN_ALLOWED,                                     //10
        UNICORN_AIRLOCK_OUT_ALLOWED,                                    //11

        LAND_AIRLOCK_IN_ALLOWED,                                        //12
        LAND_AIRLOCK_OUT_ALLOWED,                                       //13

        BANK_STASH_RBW_IN_ALLOWED,                                      //14
        BANK_STASH_RBW_OUT_ALLOWED,                                     //15
        BANK_STASH_UNIM_IN_ALLOWED,                                     //16
        BANK_STASH_UNIM_OUT_ALLOWED,                                    //17
        BANK_STASH_LOOTBOX_IN_ALLOWED,                                  //18
        BANK_STASH_KEYSTONE_OUT_ALLOWED,                                //19

        FARM_RMP_BUY,                                                   //20
        FARM_RMP_SELL,                                                  //21

        GEM_MINT_ALLOWED,                                               //22
        GEM_EQUIP_ALLOWED,                                              //23

        TRIBE_ACCESS_ALLOWED,                                           //24
        TRIBE_DONATE_ALLOWED,                                           //25
        TRIBE_ADMIN_ALLOWED,                                            //26
        BANK_STASH_RIFTCRYSTAL_IN_ALLOWED,                              //27
        BANK_STASH_UNICORNSOUL_IN_ALLOWED                               //28
    }

    event PermissionsChanged(
        address indexed owner,
        address indexed delegate,
        uint256 oldPermissions,
        uint256 newPermissions
    );
}
