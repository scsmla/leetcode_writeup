# @param {Integer[][]} grid
# @return {Boolean}
# Link: https://leetcode.com/problems/disconnect-path-in-a-binary-matrix-by-at-most-one-flip/description/
def is_possible_to_cut_path(grid)
  m, n = grid.length, grid[0].length
  return true if !dfs(grid, 0, 0)
  grid[0][0] = 1
  return !dfs(grid, 0, 0)
end

def dfs(grid, curr_x, curr_y)
  m, n = grid.length, grid[0].length
  return true if curr_x == m-1 && curr_y == n-1
  return false if curr_x >= m || curr_y >= n || grid[curr_x][curr_y] == 0
  grid[curr_x][curr_y] = 0
  return dfs(grid, curr_x+1, curr_y) || dfs(grid, curr_x, curr_y+1)
end
