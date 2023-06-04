# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/find-the-maximum-number-of-marked-indices/description/
def max_num_of_marked_indices(nums)
  n = nums.length
  nums = nums.sort
  count = 0
  for i in (n-n/2)..n-1
    count += 1 if 2*nums[count] <= nums[i]
  end
  count*2
end
