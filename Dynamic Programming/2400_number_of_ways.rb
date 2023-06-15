# @param {Integer} start_pos
# @param {Integer} end_pos
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/number-of-ways-to-reach-a-position-after-exactly-k-steps/description/
def number_of_ways(start_pos, end_pos, k)
  mod = 10**9 + 7
  dp = Array.new(1001){Array.new(1001, 0)}
  for i in 1..1000
    dp[i][i] = 1
    for j in 0..i-1
      dp[i][j] = (dp[i-1][(j-1).abs] + dp[i-1][j+1]) % mod
    end
  end

  dp[k][(start_pos-end_pos).abs]
end
