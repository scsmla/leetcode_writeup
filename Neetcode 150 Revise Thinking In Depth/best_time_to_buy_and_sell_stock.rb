# @param {Integer[]} prices
# @return {Integer}
# Time complexity: O(n)
# Space complexity: O(1)
def max_profit(prices)
  n = prices.length
  min_so_far = 10**5
  max_profit = 0

  for i in 0..n-1
    min_so_far = [prices[i], min_so_far].min
    max_profit = [prices[i] - min_so_far, max_profit].max
  end

  max_profit
end
