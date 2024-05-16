# @param {Integer[][]} grid
# @return {Boolean}
def satisfies_conditions(grid)
  m = grid.length
  n = grid[0].length

  for i in 0..m-1
    for j in 0..n-1
      return false if grid[i][j] != grid[i+1][j] if i < m - 1
      return false if grid[i][j] == grid[i][j+1] if j < n - 1
    end
  end

  true
end
