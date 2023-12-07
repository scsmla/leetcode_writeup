# @param {Integer[]} prices
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-number-of-coins-for-fruits/description/
def minimum_coins(prices)
  n = prices.length
  dp = Array.new(n+1, 0)
  last = []

  for i in 0..n-1
    while(!last.empty? && (last[0] + 1) * 2 < i + 1)
      last.shift
    end

    while(!last.empty? && dp[last[-1]] + prices[last[-1]] >= prices[i] + dp[i])
      last.pop
    end

    last << i
    dp[i+1] = dp[last[0]] + prices[last[0]]
  end

  dp[-1]
end
