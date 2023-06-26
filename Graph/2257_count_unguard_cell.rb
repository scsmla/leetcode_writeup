# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} guards
# @param {Integer[][]} walls
# @return {Integer}
# Link: https://leetcode.com/problems/count-unguarded-cells-in-the-grid/description/
def count_unguarded(m, n, guards, walls)
  g = guards.length
  w = walls.length
  ans = m * n - g - w
  grid = Array.new(m){Array.new(n, '')}

  for i in 0..g-1
    x, y = guards[i]
    grid[x][y] = 'G'
  end

  for i in 0..w-1
    x, y = walls[i]
    grid[x][y] = 'W'
  end

  dirs = [[1, 0], [-1, 0], [0, -1], [0, 1]]

  for i in 0..g-1
    for j in 0..dirs.length-1
      dir_x, dir_y = dirs[j]
      x, y = [guards[i][0] + dir_x, guards[i][1] + dir_y]

      while(!(x < 0 || x >= m || y < 0 || y >= n || grid[x][y] == 'G' || grid[x][y] == 'W'))
        ans -= 1 if grid[x][y] != 'P'
        grid[x][y] = 'P'
        x += dir_x
        y += dir_y
      end
    end
  end

  ans
end
