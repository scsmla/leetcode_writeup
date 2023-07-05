# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
# Link: https://leetcode.com/problems/k-radius-subarray-averages/description/
def get_averages(nums, k)
  return nums if k == 0
  n = nums.length
  res = Array.new(n, -1)
  return res if 2*k > n-1
  prev = nums[0..k-1].sum
  nex = nums[k+1..k*2].sum
  for i in k..n-1-k
    res[i] = (prev+nex+nums[i])/(2*k+1)
    prev -= nums[i-k]
    prev += nums[i]
    nex -= nums[i+1]
    nex += nums[i+k+1] if i+k+1 <= n-1
  end

  res
end
