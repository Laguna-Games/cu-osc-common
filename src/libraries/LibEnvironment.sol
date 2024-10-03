// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {IArbSys} from '../interfaces/IArbSys.sol';
import {IArbInfo} from '../interfaces/IArbInfo.sol';

/// @custom:see https://docs.arbitrum.io/build-decentralized-apps/arbitrum-vs-ethereum/solidity-support#:~:text=Returns%20an%20%22estimate%22%20of%20the%20L1%20block%20number%20at%20which%20the%20sequencer%20received%20the%20transaction
/// @custom:see https://docs.arbitrum.io/build-decentralized-apps/precompiles/reference
/// @custom:see https://github.com/OffchainLabs/arb-os/blob/develop/contracts/arbos/builtin/ArbSys.sol
library LibEnvironment {
    address private constant ARB_SYS_ADDRESS = 0x0000000000000000000000000000000000000064;
    address private constant ARB_INFO_ADDRESS = 0x0000000000000000000000000000000000000065;

    /// @notice Get the chain ID for the local chain
    /// @dev On Arbitrum based chains, this should replace `block.chainid` in code!
    /// @return returnChainId ID of the current chain
    function chainId() internal view returns (uint256 returnChainId) {
        try IArbSys(ARB_SYS_ADDRESS).arbChainID() returns (uint256 _chainId) {
            returnChainId = _chainId;
        } catch {
            revert('LibEnvironment: address 64 is not an ArbSys contract');
        }
    }

    /// @notice Retrieves an account's balance
    function getBalance(address account) internal view returns (uint256 returnBalance) {
        try IArbInfo(ARB_INFO_ADDRESS).getBalance(account) returns (uint256 _balance) {
            returnBalance = _balance;
        } catch {
            revert('LibEnvironment: address 65 is not an ArbInfo contract');
        }
    }

    /// @notice Retrieves a contract's deployed code
    function getCode(address account) internal view returns (bytes memory returnCode) {
        try IArbInfo(ARB_INFO_ADDRESS).getCode(account) returns (bytes memory _code) {
            returnCode = _code;
        } catch {
            revert('LibEnvironment: address 65 is not an ArbInfo contract');
        }
    }

    /// @notice Get the block number for the local chain
    /// @dev On Arbitrum based chains, this should replace `block.number` in code!
    /// @return returnBlockNumber number of the current chain
    function getBlockNumber() internal view returns (uint256 returnBlockNumber) {
        try IArbSys(ARB_SYS_ADDRESS).arbBlockNumber() returns (uint256 _blockNumber) {
            returnBlockNumber = _blockNumber;
        } catch {
            revert('LibEnvironment: address 64 is not an ArbSys contract');
        }
    }

    function blockNumber() internal view returns (uint256) {
        return getBlockNumber();
    }

    function chainIsArbitrum(uint256 _chainId) internal pure returns (bool) {
        return chainIsArbitrumMainnet(_chainId) || chainIsArbitrumSepolia(_chainId);
    }

    function chainIsArbitrumMainnet(uint256 _chainId) internal pure returns (bool) {
        return _chainId == 42161;
    }

    function chainIsArbitrumSepolia(uint256 _chainId) internal pure returns (bool) {
        return _chainId == 421614;
    }

    function chainIsXai(uint256 _chainId) internal pure returns (bool) {
        return chainIsXaiMainnet(_chainId) || chainIsXaiSepolia(_chainId);
    }

    function chainIsXaiMainnet(uint256 _chainId) internal pure returns (bool) {
        return _chainId == 660279;
    }

    function chainIsXaiSepolia(uint256 _chainId) internal pure returns (bool) {
        return _chainId == 37714555429;
    }
}
