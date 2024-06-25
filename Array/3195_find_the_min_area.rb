# @param {Integer[][]} grid
# @return {Integer}
def minimum_area(grid)
  m, n = grid.length, grid[0].length
  min_row, max_row = nil, nil
  min_col, max_col = nil, nil

  for i in 0..m-1
    for j in 0..n-1
      if grid[i][j] == 1
        min_row = i if min_row.nil?
        max_row = i if max_row.nil?
        min_row = [min_row, i].min
        max_row = [max_row, i].max

        min_col = j if min_col.nil?
        max_col = j if max_col.nil?
        min_col = [min_col, j].min
        max_col = [max_col, j].max
      end
    end
  end

  (max_row - min_row + 1) * (max_col - min_col + 1)
end
