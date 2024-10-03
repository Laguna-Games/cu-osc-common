// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LibArrayUtils {
    function swapAndPopArray(uint256[] storage array, uint256 item) internal {
        uint256 index = array.length - 1;
        for (uint256 i = 0; i < array.length; ++i) {
            if (array[i] == item) {
                index = i;
                break;
            }
        }
        if (index < array.length) {
            array[index] = array[array.length - 1];
            array.pop();
        }
    }

    function swapAndPopArrayUsingIdx(uint40[] storage array, uint256 idx) internal {
        require(idx < array.length, 'MI-003');
        if (idx == array.length - 1) {
            array.pop();
            return;
        }
        array[idx] = array[array.length - 1];
        array.pop();
    }

    function addArrays(uint256[] memory array1, uint256[] memory array2) public pure returns (uint256[] memory) {
        require(array1.length == array2.length, 'GA-003');

        uint256[] memory result = new uint256[](array1.length);

        for (uint i = 0; i < array1.length; ++i) {
            result[i] = array1[i] + array2[i];
        }

        return result;
    }

    function checkNonZeroUintArray(uint256[] memory array) public pure returns (bool) {
        for (uint i = 0; i < array.length; ++i) {
            if (array[i] != 0) {
                return true;
            }
        }
        return false;
    }

    function appendUintArrays(uint256[] memory a, uint256[] memory b) internal pure returns (uint256[] memory result) {
        result = new uint256[](a.length + b.length);
        uint256 i;
        for (i = 0; i < a.length; ++i) {
            result[i] = a[i];
        }
        for (i = 0; i < b.length; ++i) {
            result[i + a.length] = b[i];
        }
        return result;
    }

    function appendUint24Arrays(uint24[] memory a, uint24[5] memory b) internal pure returns (uint24[] memory result) {
        result = new uint24[](a.length + b.length);
        uint256 i;
        for (i = 0; i < a.length; ++i) {
            result[i] = a[i];
        }
        for (i = 0; i < b.length; ++i) {
            result[i + a.length] = b[i];
        }
        return result;
    }
}
