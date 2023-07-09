# @param {Integer[][]} grid
# @return {Integer}
# Link: https://leetcode.com/problems/grid-game/description/
def grid_game(grid)
  t = grid[0].sum
  b = 0
  ans = 10**20
  for i in 0..grid[0].length-1
    t = t-grid[0][i]
    ans = [ans, [t, b].max].min
    b += grid[1][i]
  end

  ans
end
