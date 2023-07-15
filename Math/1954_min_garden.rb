# @param {Integer} needed_apples
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-garden-perimeter-to-collect-enough-apples/description/
def minimum_perimeter(needed_apples)
  edge = 0
  total = 12
  diff = 48
  while(total < needed_apples)
    total += diff
    diff += 24*edge + 60
    edge += 1
  end

  (edge+1) * 8
end
