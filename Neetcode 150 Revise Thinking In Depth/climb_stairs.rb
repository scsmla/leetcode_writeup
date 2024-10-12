# @param {Integer} n
# @return {Integer}
#---------------------------------------------------------
# Time complexity: O(n)
# Space complexity: O(n)
def climb_stairs(n)
  dp = Array.new(n+1, 0)
  dp[0] = 1
  dp[1] = 1

  for i in 2..n
    dp[i] = dp[i-1] + dp[i-2]
  end

  dp[n]
end


# Time complexity: O(n)
# Space complexity: O(1)
# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return 1 if n == 1

  a = 1
  b = 1

  for i in 2..n
    c = a + b
    a = b
    b = c
  end

  c
end
