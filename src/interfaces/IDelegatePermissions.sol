// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import {IPermissionProvider} from "./IPermissionProvider.sol";

interface IDelegatePermissions {
    //  Resets all permissions granted by the caller (delegator) to 0/false.
    //  @emits PermissionsChanged
    function resetDelegatePermissions() external;

    //  Returns the delegate address of a wallet, or 0 if unset.
    //  @param address delegator - The delegator/scholar address to query
    //  @return address delegate - The address with permissions on this account
    function getDelegate(address delegator) external view returns (address delegate);


    //  Returns the delegator address for a delegate, or 0 if unset.
    //  @param address delegate - The address with delegated permissions
    //  @return address delegator - The address granting permissions to the delegate
    function getDelegator(address delegate) external view returns (address delegator);


    //  Returns the location of a Permission in the raw permissions binary map.
    //  @param Permission p - A permission to lookup
    //  @return uint256 index - The location of the permission-bit in the rawPermissions
    function getIndexForDelegatePermission(IPermissionProvider.Permission p) external pure returns (uint256 index);


    //  Returns the raw permission bit array granted by an delegator to a delegate.
    //  If the delegator and delegate arguments don't match the getDelegator/getDelegate
    //  mapping, an error will be thrown.
    //  delegate-less wallet to check the current permission settings.
    //  @param address delegator - The address granteing permission
    //  @return uint256 rawPermissions - The raw bit array of granted permissions
    function getRawDelegatePermissions(address delegator) external view returns (uint256 rawPermissions);


    //  Sets the raw permission bit array granted by the caller.
    //  @return uint256 rawPermissions - The raw bit array of granted permissions
    //  @emits PermissionsChanged
    function setDelegatePermissionsRaw(uint256 rawPermissions) external;


    //  Returns true if the delegator is granting the permission to the delegate.
    //  @param address delegator - The address granteing permission
    //  @param Permission p - The permission to check
    //  @return bool - True if the permission is allowed, otherwise false
    function checkDelegatePermission(address delegator, IPermissionProvider.Permission p) external view returns (bool);


    //  Checks if the delegator is granting permission to the delegate for a list 
    //  of permissions.
    //  @param address delegator - The address granteing permission
    //  @param Permission[] p - List of permissions to check
    //  @return bool - Returns if the delegate associated to the delegator has all the permissions inside the Permission[] array
    function checkDelegatePermissions(address delegator, IPermissionProvider.Permission[] calldata p) external view returns (bool);


    //  Checks if the delegator is granting the permission to the delegate. If the 
    //  permission is not allowed, the transaction will be reverted with an error.
    //  @param address delegator - The address granteing permission
    //  @param Permission p - The permission to check
    function requireDelegatePermission(address delegator, IPermissionProvider.Permission p) external view;


    //  Checks if the delegator is granting multiple permissions to the delegate.
    //  If any of the permissions are not allowed, the transaction will be reverted
    //  with an error.
    //  @param address delegator - The address granteing permission
    //  @param Permission[] p - List of permissions to check
    function requireDelegatePermissions(address delegator, IPermissionProvider.Permission[] calldata p) external view;


    //  Sets an individual permission bit flag to true or false for the caller,
    //  which grants that permission to the associated delegate address. If no 
    //  delegate is assigned (ie. address 0) then the permission is still set and
    //  will become active when a delegate address is set.
    //  @param Permission permission - The permission to set
    //  @param bool state - True to allow permission, or false to revoke
    //  @emits PermissionsChanged
    function setDelegatePermission(IPermissionProvider.Permission permission, bool state) external;


    //  Sets multiple permissions to true or false for the caller, which grants
    //  those permissions t othe associated delegate address. If no delegate is 
    //  assigned (ie. address 0) then the permissions will still be set and will
    //  become active when a delegate address is set.
    //  @param Permission[] permissions - A list of permissions
    //  @param bool[] states - True or false for each Permission
    //  @emits PermissionsChanged
    function setDelegatePermissions(IPermissionProvider.Permission[] calldata permissions, bool[] calldata states) external;
}