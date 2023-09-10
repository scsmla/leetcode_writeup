# @param {Integer[]} values
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-score-triangulation-of-polygon/description/
def min_score_triangulation(values)
  max = 10**9
  dp = Array.new(50){Array.new(50, 0)}
  n = values.length

  for i in (n-1).downto(0)
    for j in (i+1)..n-1
      for k in (i+1)..j-1
        dp[i][j] = [dp[i][j] == 0 ? max : dp[i][j], dp[i][k] + values[i] * values[j] * values[k] + dp[k][j]].min
      end
    end
  end

  dp[0][n-1]
end
