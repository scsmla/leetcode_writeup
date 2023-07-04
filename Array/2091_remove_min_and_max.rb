# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/removing-minimum-and-maximum-from-array/description/
def minimum_deletions(nums)
  min = nums.min
  max = nums.max
  min_idx = 0
  max_idx = 0
  for i in 0..nums.length-1
    min_idx = i if nums[i] == min
    max_idx = i if nums[i] == max
  end
  n = nums.length
  f, s = [min_idx, max_idx].sort
  return s+1 if s+1 <= n-f && s+1 <= f +1+ n - s
  return n - f if n - f <= s+1 && n - f <= f+1 + n - s
  return f+1 + n - s if f+1 + n -s <= s+1 && f+1+ n - s <= n-f
end
