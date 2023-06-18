# @param {Integer[]} nums
# @return {Boolean}
# Link: https://leetcode.com/problems/check-if-there-is-a-valid-partition-for-the-array/description/
def valid_partition(nums)
  n = nums.length
  return nums[0] == nums[1] if n == 2
  dp = Array.new(n+1, false)
  dp[0] = true
  dp[1] = false
  dp[2] = true if nums[0] == nums[1]
  dp[2] = true if (nums[1] == nums[0] && nums[2] == nums[1]) || (nums[2] - nums[1] == 1 && nums[1] - nums[0] == 1)

  for i in 3..n
    ans = false
    ans = ans || dp[i-2] if nums[i-1] == nums[i-2]
    ans = ans || dp[i-3] if nums[i-1] == nums[i-2] && nums[i-2] == nums[i-3]
    ans = ans || dp[i-3] if nums[i-1] - nums[i-2] == 1 && nums[i-2] - nums[i-3] == 1

    dp[i] = ans
  end

  dp[n]
end
