# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-average-difference/description/
def minimum_average_difference(nums)
  curr_s = 0
  sum = nums.sum
  n = nums.length
  min = 10**6
  res = -1
  for i in 0..n-1
    curr_s += nums[i]
    l = sum - curr_s
    f = curr_s/(i+1)
    l /= (n-1-i) if i < n-1
    if (l-f).abs < min
      res = i
      min = (l-f).abs
    end
  end

  res
end
