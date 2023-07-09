// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;


// for example you are swapping eth and bobtoken - thereby increasing ETH in the pool and decreasing bobTOKEN in the pool.

// x: Current balance of ETH in the trading pool

// y: Current balance of bobTOKEN in the trading pool

// Δx: Amount of ETH being swapped into the trading pool

// Δy: Amount of bobTOKEN that will be swapped out of the trading pool


// (x + Δx) * (y - Δy) = k // original equation 

// we can calculate for Δy by equating and rearranging the two since they're both equal to k
// now Δy = (y * Δx) / (x + Δx)., 

function calculateOutputAmount(uint256 inputAmount , uint256 inputReserve, uint256 outputReserve) pure returns(uint256){
    uint256 outputAmount = (outputReserve * inputAmount) / (inputReserve + inputAmount);
    return outputAmount;
}

//Assume we have 100 ETH and 200 bobTOKEN in the trading pool smart contract. Let's do the math on what would happen if we wanted to swap 1 ETH for TOKENs.

// inputAmount = 1 ETH

// inputReserve = 100 ETH

// outputReserve = 200 bob Tokens

// => outputAmount = 1.98019802 bob Tokens

