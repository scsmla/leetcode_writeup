# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/longest-square-streak-in-an-array/description/
def longest_square_streak(nums)
  n = nums.length
  nums = nums.sort
  dp = Hash.new
  a = Hash.new
  max = 0
  for i in 0..n-1
    a[nums[i]] = 1
    dp[nums[i]] = 0
    next if Math.sqrt(nums[i]).ceil != Math.sqrt(nums[i]).to_i
    if !a[Math.sqrt(nums[i]).to_i].nil?
      dp[nums[i]] = dp[Math.sqrt(nums[i]).to_i] + 1
      max = [max, dp[nums[i]]].max
    end
  end

  max == 0 ? -1 : max + 1
end
