# @param {Integer[]} coins
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-number-of-consecutive-values-you-can-make/description/
def get_maximum_consecutive(coins)
  coins = coins.sort
  res = 1

  for i in 0..coins.length-1
    break if coins[i] > res
    res += coins[i]
  end

  res
end
