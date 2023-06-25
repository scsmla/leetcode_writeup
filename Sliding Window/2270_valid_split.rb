# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/number-of-ways-to-split-array/description/
def ways_to_split_array(nums)
  n = nums.length
  sum = nums.sum
  curr = 0
  ans = 0
  for i in 0..n-2
    curr += nums[i]
    ans += 1 if curr >= sum - curr
  end

  ans
end
