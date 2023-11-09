# @param {Integer[]} nums
# @param {Integer} modulo
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/count-of-interesting-subarrays/description/
def count_interesting_subarrays(nums, modulo, k)
  n = nums.length
  a = Hash.new
  pre = 0
  res = 0
  a[0] = 1

  for i in 0..n-1
    pre += 1 if nums[i] % modulo == k
    pre %= modulo

    if !a[(pre-k+modulo) % modulo].nil?
      res += a[(pre-k+modulo) % modulo]
    end

    a[pre] = 0 if a[pre].nil?
    a[pre] += 1
  end

  res
end
