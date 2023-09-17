# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
# Link: https://leetcode.com/problems/continuous-subarray-sum/

def check_subarray_sum(nums, k)
  a = Hash.new
  n = nums.length
  curr = 0

  for i in 0..n-1
    curr += nums[i]
    return true if curr % k == 0 && i >= 1
    a[curr % k] = [] if a[curr % k].nil?
    a[curr % k] << i

    if a[curr % k].length >= 2
      return true if a[curr%k][-1] - a[curr%k][0] >= 2
    end
  end

  false
end
