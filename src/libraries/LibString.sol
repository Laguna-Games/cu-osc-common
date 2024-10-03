// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Strings} from '../../lib/openzeppelin-contracts/contracts/utils/Strings.sol';

/// @author Uriel Chami
library LibString {
    /// @notice Converts uint to readable string
    /// @dev Any uint from uint8 up to uint256
    /// @param i uint8 to uint256 number to convert
    /// @return number as string
    function uintToString(uint256 i) internal pure returns (string memory) {
        // https://neznein9.medium.com/the-fastest-way-to-convert-uint256-to-string-in-solidity-b880cfa5f377
        return Strings.toString(i);
    }

    /// @notice Converts address to readable string
    /// @dev the final string includes "0x"
    /// @param a address to convert
    /// @return address as string including "0x" at the start
    function addressToString(address a) internal pure returns (string memory) {
        //  https://gist.github.com/Rob-lg/bd4504213cf1c6fa3db3c2737196dad6
        return Strings.toHexString(a);
    }

    function char(bytes1 b) internal pure returns (bytes1 c) {
        if (uint8(b) < 10) return bytes1(uint8(b) + 0x30);
        else return bytes1(uint8(b) + 0x57);
    }

    function toHexDigit(uint8 d) internal pure returns (bytes1) {
        if (0 <= d && d <= 9) {
            return bytes1(uint8(bytes1('0')) + d);
        } else if (10 <= uint8(d) && uint8(d) <= 15) {
            return bytes1(uint8(bytes1('a')) + d - 10);
        }
        revert();
    }

    /// @notice Converts bytes4 to readable string
    /// @dev the final string includes "0x". useful for selectors
    /// @param code bytes4 to convert
    /// @return s bytes4 as string including "0x" at the start
    function selectorToString(bytes4 code) internal pure returns (string memory) {
        bytes memory result = new bytes(10);
        result[0] = bytes1('0');
        result[1] = bytes1('x');
        for (uint i = 0; i < 4; ++i) {
            result[2 * i + 2] = toHexDigit(uint8(code[i]) / 16);
            result[2 * i + 3] = toHexDigit(uint8(code[i]) % 16);
        }
        return string(result);
    }
}
