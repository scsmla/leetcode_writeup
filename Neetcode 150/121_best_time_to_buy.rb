# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  min = 10**4
  profit = 0

  for i in 0..prices.length-1
    min = [min, prices[i]].min
    profit = [prices[i] - min, profit].max
  end

  profit
end
