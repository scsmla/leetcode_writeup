# @param {Integer[][]} grid
# @return {Integer}
def number_of_right_triangles(grid)
  m, n = grid.length, grid[0].length
  count_row = Array.new(m, 0)
  count_col = Array.new(n, 0)

  for i in 0..m-1
    for j in 0..n-1
      count_row[i] += 1 if grid[i][j] == 1
      count_col[j] += 1 if grid[i][j] == 1
    end
  end

  res = 0

  for i in 0..m-1
    for j in 0..n-1
      if grid[i][j] == 1
        curr_row = count_row[i] - 1
        curr_col = count_col[j] - 1

        res += curr_row * curr_col
      end
    end
  end

  res
end
