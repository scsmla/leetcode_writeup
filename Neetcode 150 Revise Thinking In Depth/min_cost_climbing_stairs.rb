# @param {Integer[]} cost
# @return {Integer}
# Time complexity: O(n)
# Space complexity: O(n)
def min_cost_climbing_stairs(cost)
  n = cost.length
  dp = Array.new(n+1, 0)

  for i in 2..n
    dp[i] = [dp[i-1] + cost[i-1], dp[i-2] + cost[i-2]].min
  end

  dp[n]
end



# @param {Integer[]} cost
# @return {Integer}
# Time complexity: O(n)
# Space complexity: O(1)
def min_cost_climbing_stairs(cost)
  n = cost.length
  dp = Array.new(n+1, 0)
  a, b, c = 0, 0, 0

  for i in 2..n
    c = [b + cost[i-1], a + cost[i-2]].min
    a = b
    b = c
  end

  c
end
