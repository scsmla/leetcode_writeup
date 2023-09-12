# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/subarray-sums-divisible-by-k/description/
def subarrays_div_by_k(nums, k)
  n = nums.length
  div = Array.new(k, 0)
  curr = 0
  res = 0

  for i in 0..n-1
    curr += nums[i]
    curr_div = curr % k
    res += 1 if curr_div == 0
    res += div[curr_div]
    div[curr_div] += 1
  end

  res
end
