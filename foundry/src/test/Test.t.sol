// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../StakeContract.sol";
import "./mocks/MockERC20.sol";

contract StakeContractTest is Test {
    StakeContract public stakeContract;
    MockERC20 public mockERC20;

    function setUp() public {
        stakeContract = new StakeContract();
        mockERC20 = new MockERC20();
    }

    function test_staking_tokens_fuzz(uint256 amount) public {
        // is the staking call returning true?
        mockERC20.approve(address(stakeContract), amount);
        bool stakePassed = stakeContract.stake(amount, address(mockERC20));
        // assertTrue(stakeContract.s_balances);
        assertTrue(stakePassed);
    }
}
