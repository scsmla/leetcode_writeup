# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/subarray-sum-equals-k/description/
def subarray_sum(nums, k)
  n = nums.length
  p_sum = Array.new(n, 0)
  p_sum[0] = nums[0]

  for i in 1..nums.length-1
    p_sum[i] = p_sum[i-1] + nums[i]
  end

  a = Hash.new
  ans = 0

  for i in 0..n-1
    ans += 1 if p_sum[i] == k

    if !a[p_sum[i] - k].nil?
      ans += a[p_sum[i]-k]
    end

    a[p_sum[i]] = 0 if a[p_sum[i]].nil?
    a[p_sum[i]] += 1
  end

  ans
end
