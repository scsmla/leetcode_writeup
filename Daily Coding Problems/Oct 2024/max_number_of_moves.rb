# @param {Integer[][]} grid
# @return {Integer}
def max_moves(grid)
  m, n = grid.length, grid[0].length
  dp = Array.new(m){Array.new(n, -10**5)}

  for i in 0..m-1
    dp[i][0] = 0
  end

  max = 0

  for j in 1..n-1
    for i in 0..m-1
      if i > 0 && grid[i][j] > grid[i-1][j-1]
        dp[i][j] = [dp[i-1][j-1] + 1, dp[i][j]].max
      end

      if grid[i][j] > grid[i][j-1]
        dp[i][j] = [dp[i][j-1] + 1, dp[i][j]].max
      end

       if i < m-1 && grid[i][j] > grid[i+1][j-1]
        dp[i][j] = [dp[i+1][j-1] + 1, dp[i][j]].max
      end

      max = [max, dp[i][j]].max
    end
  end

  max
end
