# @param {Integer[][]} grid
# @return {Integer[][]}
# Link: https://leetcode.com/problems/construct-product-matrix/
def construct_product_matrix(grid)
  m, n = grid.length, grid[0].length
  prefix = Array.new(m){Array.new(n, 1)}
  suffix = Array.new(m){Array.new(n, 1)}
  modulo = 12345

  curr = 1
  for i in 0..m-1
    for j in 0..n-1
      prefix[i][j] = curr
      curr *= grid[i][j]
      curr %= modulo
    end
  end

  curr = 1
  for i in (m-1).downto(0)
    for j in (n-1).downto(0)
      suffix[i][j] = curr
      curr *= grid[i][j]
      curr %= modulo
    end
  end


  res = Array.new(m){Array.new(n, 1)}

  for i in 0..m-1
    for j in 0..n-1
      res[i][j] = prefix[i][j] * suffix[i][j]
      res[i][j] %= modulo
    end
  end

  res
end
