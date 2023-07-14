# @param {Integer[]} nums
# @return {Integer[]}
# Link: https://leetcode.com/problems/array-with-elements-not-equal-to-average-of-neighbors/description/
def rearrange_array(nums)
  nums = nums.sort
  n = nums.length
  ans = []
  ans.push(nums[0])
  i = 1
  while(i < n)
    ans.push(nums[i+1]) if i + 1 <= n-1
    ans.push(nums[i])
    i += 2
  end

  ans
end
