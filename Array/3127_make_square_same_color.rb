# @param {Character[][]} grid
# @return {Boolean}
def can_make_square(grid)
  groups = [
    [grid[0][0], grid[0][1], grid[1][0], grid[1][1]],
    [grid[0][1], grid[0][2], grid[1][1], grid[1][2]],
    [grid[1][0], grid[1][1], grid[2][0], grid[2][1]],
    [grid[1][1], grid[1][2], grid[2][1], grid[2][2]],
  ]

  groups.each do |group|
    return true if group.tally.to_a.sort_by{|x| x[1]}[-1][1] >= 3
  end

  false
end
