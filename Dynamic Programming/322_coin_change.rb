# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
# Link: https://leetcode.com/problems/coin-change/
def coin_change(coins, amount)
  return 0 if amount == 0

  n = coins.length
  coins = coins.sort

  dp = Array.new(amount+1, 10**5)
  dp[0] = 0
  min = coins[0]
  return -1 if min > amount

  for i in min..amount
    for j in 0..coins.length-1
      break if i - coins[j] < 0
      dp[i] = [dp[i], dp[i-coins[j]] + 1].min
    end
  end

  dp[amount] == 10 ** 5 ? -1 : dp[amount]
end
