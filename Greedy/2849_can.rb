# @param {Integer} sx
# @param {Integer} sy
# @param {Integer} fx
# @param {Integer} fy
# @param {Integer} t
# @return {Boolean}
# Link: https://leetcode.com/problems/determine-if-a-cell-is-reachable-at-a-given-time/description/
def is_reachable_at_time(sx, sy, fx, fy, t)
  abs_x = (sx - fx).abs
  abs_y = (sy - fy).abs
  return false if sx == fx && sy == fy && t == 1

  min = [abs_x, abs_y].max
  return false if min > t
  true
end
