// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

// why would anyone put token  in a third-party contract if they are not getting something out of it


// So, how do we calculate the amount of LP-tokens to be minted when liquidity is added?

// Uniswap V1 calculates the amount proportionate to the ETH reserve. The following equation shows how the amount of new LP-tokens is calculated depending on how much ETH is deposited:

// amountMinted = (totalAmount * ethDeposited) / ethReserve

function addLiquidity(uint tokenAmount) payable {
    if (getReserve() == 0) {

        uint liquidity = address(this).balance;
        _mint(msg.sender, liquidity);
    } else {
        
        uint liquidity = (totalSupply() * msg.value) / ethReserve;
        _mint(msg.sender, liquidity);
    }
}

//  uniswap takes 0.03% fees from each swap.
// We had outputAmount = (outputReserve * inputAmount) / (inputReserve + inputAmount)

// Now outputAmountWithFees = 0.99 * outputAmount

// But, Solidity does not support floating point operations. So for Solidity we rewrite the formula as such 
// outputAmountWithFees = (outputAmount * 99) / 100