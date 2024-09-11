# @param {Integer} start
# @param {Integer} goal
# @return {Integer}
def min_bit_flips(start, goal)
  start_bit = start.to_s(2)
  goal_bit = goal.to_s(2)
  i = start_bit.length-1
  j = goal_bit.length-1
  count = 0

  while(i >= 0 && j >= 0)
    count += 1 if start_bit[i] != goal_bit[j]
    i -= 1
    j -= 1
  end

  while(i >= 0)
    count += 1 if start_bit[i] != '0'
    i -= 1
  end

  while(j >= 0)
    count += 1 if goal_bit[j] != '0'
    j -= 1
  end

  count
end
