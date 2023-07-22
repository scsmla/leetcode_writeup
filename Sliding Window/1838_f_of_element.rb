# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/frequency-of-the-most-frequent-element/description/
def max_frequency(nums, k)
  nums = nums.sort
  sum = 0
  i = 0
  res = 0
  for j in 0..nums.length-1
    sum += nums[j]

    while(sum + k < nums[j]*(j-i+1))
      sum -= nums[i]
      i += 1
    end

    res = [res, j-i+1].max
  end

  res
end
