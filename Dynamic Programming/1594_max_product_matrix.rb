# @param {Integer[][]} grid
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-non-negative-product-in-a-matrix/description/
def max_product_path(grid)
  m, n = grid.length, grid[0].length
  max = Array.new(m){Array.new(n, 0)}
  min = Array.new(m){Array.new(n, 0)}
  max[0][0] = grid[0][0]
  min[0][0] = grid[0][0]

  for i in 1..n-1
    max[0][i] = max[0][i-1] * grid[0][i]
    min[0][i] = min[0][i-1] * grid[0][i]
  end

  for i in 1..m-1
    max[i][0] = max[i-1][0]*grid[i][0]
    min[i][0] = min[i-1][0]*grid[i][0]
  end

  for i in 1..m-1
    for j in 1..n-1
      if grid[i][j] < 0
        max[i][j] = [min[i-1][j], min[i][j-1]].min * grid[i][j]
        min[i][j] = [max[i-1][j], max[i][j-1]].max * grid[i][j]
      else
        max[i][j] = [max[i-1][j], max[i][j-1]].max * grid[i][j]
        min[i][j] = [min[i-1][j], min[i][j-1]].min * grid[i][j]
      end
    end
  end

  print max

  if max[m-1][n-1] < 0
    return -1
  else
    return max[m-1][n-1] % (10**9+7)
  end
end
