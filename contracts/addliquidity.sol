// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;




// When a new cryptocurrency is created, there is initially a lack of liquidity for trading pairs involving that particular token. Consequently, it becomes challenging to determine the price of the token.

// As a result, the first person who adds liquidity to the pool has the opportunity to establish the price. Adding liquidity entails contributing tokens from both sides of the trading pair; it is not possible to add liquidity for only one side.

// Therefore, the individual who provides liquidity for the new cryptocurrency effectively determines the initial price at which it can be traded.

function addLiquidity(uint256 tokenAmount) payable {
    IERC20 token = IERC20(tokenAddress);
    token.transferFrom(msg.sender, address(this), tokenAmount);
}

// but there is a problem we have to maintain the ratio of the liquidity pool 
//A second person can come along, and add liquidity in a completely different ratio of reserves which would massively affect price calculations. We do not want to allow for such price manipulations, and we want prices on the decentralized exchange to be as close to those on centralized exchanges as possible.

// final function

function addLiquidity(uint tokenAmount)  payable {
    // assuming a hypothetical function
    // that returns the balance of the
    // token in the contract
    if (getReserve() == 0) {
        IERC20 token = IERC20(tokenAddress);
        token.transferFrom(msg.sender, address(this), tokenAmount);
    } else {
        uint ethReserve = address(this).balance - msg.value;
        uint tokenReserve = getReserve();
        uint proportionalTokenAmount = (msg.value * tokenReserve) / ethReserve;
        require(tokenAmount >= proportionalTokenAmount, "incorrect ratio of tokens provided");

        IERC20 token = IERC20(tokenAddress);
        token.transferFrom(msg.sender, address(this), proportionalTokenAmount);
    }
}