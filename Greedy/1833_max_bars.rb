# @param {Integer[]} costs
# @param {Integer} coins
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-ice-cream-bars/description/
def max_ice_cream(costs, coins)
  count = Array.new(10**5+1, 0)

  for i in 0..costs.length-1
    if costs[i] <= 10**5
      count[costs[i]] += 1
    end
  end
  ans = 0

  for i in 1..10**5
    if count[i] > 0
      if coins >= i * count[i]
        ans += count[i]
        coins -= i * count[i]
      else
        ans += coins / i
        break
      end
    end
  end

  ans
end
