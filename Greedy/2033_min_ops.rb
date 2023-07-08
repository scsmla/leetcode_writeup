# @param {Integer[][]} grid
# @param {Integer} x
# @return {Integer}
def min_operations(grid, x)
  m, n = grid.length, grid[0].length
  eles = []
  for i in 0..m-1
    for j in 0..n-1
      eles.push(grid[i][j])
    end
  end
  n = eles.length
  for i in 1..n-1
    return -1 if (eles[i] - eles[i-1]).abs % x != 0
  end

  eles = eles.sort
  res = 0
  min = 10**9

  if n % 2 == 0
    target = eles[n/2]
    for i in 0..n-1
      res += (target - eles[i]).abs / x
    end
    min = [min, res].min
    if n > 4
      target = eles[n/2+1]
      for i in 0..n-1
        res += (target - eles[i]).abs / x
      end

      min = [min, res].min
    end
  else
    target = eles[n/2]
    for i in 0..n-1
      res += (target - eles[i]).abs / x
    end

    min = [min, res].min
  end

  min
end
