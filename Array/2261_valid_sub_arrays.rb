# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} p
# @return {Integer}
# Link: https://leetcode.com/problems/k-divisible-elements-subarrays/description/
require 'set'

def count_distinct(nums, k, pa)
  res = Set.new
  n = nums.length

  for i in 0..n-1
    cnt = 0
    curr_sub = ""

    for j in i..n-1
      curr_sub.concat(nums[j])
      cnt += 1 if nums[j] % pa == 0
      res << curr_sub if cnt <= k
    end
  end

  res.size
end
