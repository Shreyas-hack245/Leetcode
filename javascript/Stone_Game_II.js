/* 1140. Stone Game II

Alice and Bob continue their games with piles of stones. There are a number of piles arranged in a row, and each pile has a positive integer number of stones piles[i]. The objective of the game is to end with the most stones.

Alice and Bob take turns, with Alice starting first.

On each player's turn, that player can take all the stones in the first X remaining piles, where 1 <= X <= 2M. Then, we set M = max(M, X). Initially, M = 1.

The game continues until all the stones have been taken.

Assuming Alice and Bob play optimally, return the maximum number of stones Alice can get.

 

Example 1:

Input: piles = [2,7,9,4,4]

Output: 10

Explanation:

If Alice takes one pile at the beginning, Bob takes two piles, then Alice takes 2 piles again. Alice can get 2 + 4 + 4 = 10 stones in total.
If Alice takes two piles at the beginning, then Bob can take all three piles left. In this case, Alice get 2 + 7 = 9 stones in total.
So we return 10 since it's larger.*/

//solution:

var stoneGameII = function(piles) {
    const n = piles.length;
    
     const suffixSums = new Array(n + 1).fill(0);
    for (let i = n - 1; i >= 0; i--) {
        suffixSums[i] = suffixSums[i + 1] + piles[i];
    }
    
     const memo = Array.from({ length: n }, () => ({}));

    function dp(i, M) {
         if (i + 2 * M >= n) {
            return suffixSums[i];
        }
        
         if (memo[i][M] !== undefined) {
            return memo[i][M];
        }
        
        let maxStones = 0;
        
         for (let X = 1; X <= 2 * M; X++) {
             const currentTurnStones = suffixSums[i] - dp(i + X, Math.max(M, X));
            maxStones = Math.max(maxStones, currentTurnStones);
        }
        
        memo[i][M] = maxStones;
        return maxStones;
    }
    
    return dp(0, 1);
};
