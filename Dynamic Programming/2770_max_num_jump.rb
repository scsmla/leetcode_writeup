# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-number-of-jumps-to-reach-the-last-index/description/
def maximum_jumps(nums, target)
  n = nums.length
  dp = Array.new(n, -10**9)
  dp[0] = 0

  for j in 1..n-1
    for i in 0..j-1
      if (nums[j] - nums[i]).abs <= target
        dp[j] = [dp[j], dp[i] + 1].max
      end
    end
  end

  # print dp
  dp[n-1] <= 0 ? -1 : dp[n-1]
end
