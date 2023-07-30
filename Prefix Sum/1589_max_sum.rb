# @param {Integer[]} nums
# @param {Integer[][]} requests
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-sum-obtained-of-any-permutation/description/
def max_sum_range_query(nums, requests)
  n = nums.length
  p_sum = Array.new(n+1, 0)
  m = requests.length

  for i in 0..m-1
    s, e = requests[i]
    p_sum[s] += 1
    p_sum[e+1] -= 1
  end

  for i in 1..n-1
    p_sum[i] += p_sum[i-1]
  end

  p_sum = p_sum.sort.reverse
  nums = nums.sort.reverse
  res = 0

  for i in 0..n-1
    res += (p_sum[i] * nums[i]) % (10**9+7)
  end

  res % (10**9+7)
end
