# @param {Character[][]} grid
# @return {Boolean}
# Link: https://leetcode.com/problems/detect-cycles-in-2d-grid/
def contains_cycle(grid)
  m, n = grid.length, grid[0].length
  dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]]

  for i in 0..m-1
    for j in 0..n-1
      if grid[i][j].ord >= 97
        val = grid[i][j]
        queue = []
        queue.push([i, j])

        while(!queue.empty?)
          queue1 = []

          for a in 0..queue.length-1
            x, y = queue[a]
            return true if grid[x][y].ord < 97

            grid[x][y] = '@'

            for k in 0..3
              row = x + dirs[k][0]
              col = y + dirs[k][1]

              if row >= 0 && col >= 0 && row < m && col < n && grid[row][col] == val
                queue1.push([row, col])
              end
            end
          end

          queue = queue1
        end
      end
    end
  end

  false
end
