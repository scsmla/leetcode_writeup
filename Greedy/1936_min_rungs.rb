# @param {Integer[]} rungs
# @param {Integer} dist
# @return {Integer}
# Link: https://leetcode.com/problems/add-minimum-number-of-rungs/description/
def add_rungs(rungs, dist)
  ans = 0
  i = 0
  rungs = rungs.unshift(0)

  for i in 1..rungs.length-1
    next if rungs[i] - rungs[i-1] <= dist
    ans += (rungs[i] - 1 - rungs[i-1])/dist
  end

  ans
end
