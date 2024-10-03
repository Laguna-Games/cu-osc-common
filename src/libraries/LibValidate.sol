// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

library LibValidate {
    function enforceNonEmptyString(string memory str) internal pure {
        require(bytes(str).length > 0, 'String cannot be empty');
    }

    function enforceNonZeroAddress(address addr) internal pure {
        require(addr != address(0), 'Address cannot be zero address');
    }

    function enforceNonEmptyAddressArray(address[] memory array) internal pure {
        require(array.length != 0, 'Address array cannot be empty.');
    }

    function enforceNonEmptyStringArray(string[] memory array) internal pure {
        require(array.length != 0, 'String array cannot be empty.');
    }

    function enforceNonEmptyUintArray(uint256[] memory array) internal pure {
        require(array.length != 0, 'uint256 array cannot be empty.');
    }

    function enforceNonEmptyBoolArray(bool[] memory array) internal pure {
        require(array.length != 0, 'bool array cannot be empty.');
    }
}
