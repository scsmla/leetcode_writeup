# @param {Integer[][]} grid
# @return {Integer}
def max_score(grid)
  m, n = grid.length, grid[0].length
  dp = Array.new(m){Array.new(n, 0)}
  max = -10**10
  dp[m-1][n-1] = grid[m-1][n-1]

  for i in (m-1).downto(0)
    for j in (n-1).downto(0)
      next if i == m-1 && j == n-1
      curr = []
      curr << dp[i+1][j] if i < m-1
      curr << dp[i][j+1] if j < n-1
      dp[i][j] = curr.max
      # dp[i][j] = [dp[i][j], dp[i+1][j]].max if i < m-1
      # dp[i][j] = [dp[i][j], dp[i][j+1]].max if j < n-1
      max = [max, dp[i][j] - grid[i][j]].max
      dp[i][j] = [grid[i][j], dp[i][j]].max
    end
  end

  # print dp

  max
end
