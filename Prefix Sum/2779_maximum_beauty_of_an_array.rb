# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-beauty-of-an-array-after-applying-operation/description/
def maximum_beauty(nums, k)
  n = nums.length
  max = nums.max
  prefix = Array.new(max+k+2, 0)

  for i in 0..n-1
    prefix[[nums[i] - k, 0].max] += 1
    prefix[nums[i] + k + 1] -= 1
  end

  c_max = 0

  for i in 1..max+k
    prefix[i] += prefix[i-1]
    c_max = [c_max, prefix[i]].max
  end

  c_max
end
