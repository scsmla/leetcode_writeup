# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
# Time complexity: O(mn)
# Space complexity: O(n)
# @param {Integer} n
# @return {Integer}

def change(amount, coins)
  dp = Array.new(amount + 1, 0)
  dp[0] = 1
  coins = coins.sort

  for j in 0..coins.length-1
    for i in coins[j]..amount
      dp[i] += dp[i-coins[j]]
    end
  end

  dp[amount]
end
