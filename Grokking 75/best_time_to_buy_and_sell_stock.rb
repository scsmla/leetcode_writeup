# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  min_s = 10**5
  max_p = 0

  for i in 0..prices.length-1
    max_p = [prices[i]-min_s, max_p].max
    min_s = [min_s, prices[i]].min
  end

  max_p
end
