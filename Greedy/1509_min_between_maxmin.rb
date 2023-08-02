# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-difference-between-largest-and-smallest-value-in-three-moves/
def min_difference(nums)
  n = nums.length
  return 0 if n < 5

  nums = nums.sort
  [nums[-1] - nums[3], nums[-2] - nums[2], nums[-3] - nums[1], nums[-4] - nums[0]].min
end
