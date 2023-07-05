# @param {Integer[]} start_pos
# @param {Integer[]} home_pos
# @param {Integer[]} row_costs
# @param {Integer[]} col_costs
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-cost-homecoming-of-a-robot-in-a-grid/
def min_cost(start_pos, home_pos, row_costs, col_costs)
  m = row_costs.length
  n = col_costs.length
  start_row, start_col = start_pos
  home_row, home_col = home_pos

  a = 0
  if start_row > home_row
    for i in (start_row-1).downto(home_row)
      a += row_costs[i]
    end
  elsif start_row < home_row
    for i in start_row+1..home_row
      a += row_costs[i]
    end
  end

  b = 0
  if start_col > home_col
    for i in (start_col-1).downto(home_col)
      b += col_costs[i]
    end
  elsif start_col < home_col
    for i in start_col+1..home_col
      b += col_costs[i]
    end
  end

  a + b
end
