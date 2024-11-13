# @param {Integer[]} nums
# @return {Integer}
def longest_square_streak(nums)
  nums = nums.sort
  n = nums.length
  dp = Hash.new

  for i in 0..nums.length-1
    sqrt_root = Math.sqrt(nums[i]).to_i

    if sqrt_root ** 2 == nums[i]
      dp[sqrt_root] ||= 0
      dp[nums[i]] = dp[sqrt_root] + 1
    else
      dp[nums[i]] = 1
    end
  end

  dp.values.max >= 2 ? dp.values.max : -1
end
