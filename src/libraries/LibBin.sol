// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

library LibBin {
    // Using the mask, determine how many bits we need to shift to extract the desired value
    //  @param _mask A bitstring with right-padding zeroes
    //  @return The number of right-padding zeroes on the _mask
    function getShiftAmount(uint256 _mask) internal pure returns (uint256 count) {
        //  Original method:
        // while (_mask & 0x1 == 0) {
        //     _mask >>= 1;
        //     ++count;
        // }

        //  Optimized method:
        //  This method uses 97% less gas than the original
        //  Details and testing: https://gist.github.com/Rob-lg/20a32a15a1d42e80780075bf8394b9ce
        assembly {
            // Check if the 128 least significant bits are zeros and shift if they are
            if iszero(and(_mask, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)) {
                count := add(count, 128)
                _mask := shr(128, _mask)
            }
            // Check if the 64 least significant bits are zeros and shift if they are
            if iszero(and(_mask, 0xFFFFFFFFFFFFFFFF)) {
                count := add(count, 64)
                _mask := shr(64, _mask)
            }
            // Check if the 32 least significant bits are zeros and shift if they are
            if iszero(and(_mask, 0xFFFFFFFF)) {
                count := add(count, 32)
                _mask := shr(32, _mask)
            }
            // Check if the 16 least significant bits are zeros and shift if they are
            if iszero(and(_mask, 0xFFFF)) {
                count := add(count, 16)
                _mask := shr(16, _mask)
            }
            // Check if the 8 least significant bits are zeros and shift if they are
            if iszero(and(_mask, 0xFF)) {
                count := add(count, 8)
                _mask := shr(8, _mask)
            }
            // Check if the 4 least significant bits are zeros and shift if they are
            if iszero(and(_mask, 0xF)) {
                count := add(count, 4)
                _mask := shr(4, _mask)
            }
            // Check if the 2 least significant bits are zeros and shift if they are
            if iszero(and(_mask, 0x3)) {
                count := add(count, 2)
                _mask := shr(2, _mask)
            }
            // Check if the least significant bit is zero and add one to count if it is
            if iszero(and(_mask, 0x1)) {
                count := add(count, 1)
            }
        }
    }

    //  Alternate function signature for boolean insertion
    function splice(uint256 _bitArray, bool _insertion, uint256 _mask) internal pure returns (uint256) {
        return splice(_bitArray, _insertion ? 1 : 0, _mask);
    }

    //  Insert _insertion data into the _bitArray bitstring
    //  @param _bitArray The base dna to manipulate
    //  @param _insertion Data to insert (no right-padding zeroes)
    //  @param _mask The location in the _bitArray where the insertion will take place
    //  @return The combined _bitArray bitstring
    function splice(uint256 _bitArray, uint256 _insertion, uint256 _mask) internal pure returns (uint256) {
        uint256 offset = getShiftAmount(_mask);
        uint256 passthroughMask = type(uint256).max ^ _mask;
        // require(_insertion & (passthroughMask >> offset) == 0, "LibBin: Overflow, review carefuly the mask limits");
        //  remove old value,  shift new value to correct spot,  mask new value
        return (_bitArray & passthroughMask) | ((_insertion << offset) & _mask);
    }

    //  Retrieves a segment from the _bitArray bitstring
    //  @param _bitArray The dna to parse
    //  @param _mask The location in teh _bitArray to isolate
    //  @return The data from _bitArray that was isolated in the _mask (no right-padding zeroes)
    function extract(uint256 _bitArray, uint256 _mask) internal pure returns (uint256) {
        uint256 offset = getShiftAmount(_mask);
        return (_bitArray & _mask) >> offset;
    }

    //  Alternate function signature for boolean retrieval
    function extractBool(uint256 _bitArray, uint256 _mask) internal pure returns (bool) {
        return (_bitArray & _mask) != 0;
    }

    function shiftLeft(uint256 bitMap, uint256 bitToChange) private pure returns (uint256) {
        return bitMap << bitToChange;
    }

    // // Set bit value at position to state
    function setBit(uint256 bitMap, uint256 bitToChange, bool state) internal pure returns (uint256) {
        uint256 shiftLeftResult = shiftLeft(1, bitToChange);
        return state ? setBitToTrue(bitMap, shiftLeftResult) : setBitToFalse(bitMap, shiftLeftResult);
    }

    function setBitToTrue(uint256 bitMap, uint256 shiftLeftResult) private pure returns (uint256) {
        return bitMap | shiftLeftResult;
    }

    function setBitToFalse(uint256 bitMap, uint256 shiftLeftResult) private pure returns (uint256) {
        return bitMap & negate(shiftLeftResult);
    }

    function negate(uint256 bitMap) private pure returns (uint256) {
        return bitMap ^ type(uint256).max;
    }

    // Get bit value at position
    function getBit(uint256 bitMap, uint256 bitToChange) internal pure returns (bool) {
        return bitMap & shiftLeft(1, bitToChange) != 0;
    }
}
