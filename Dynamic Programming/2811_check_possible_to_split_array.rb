# @param {Integer[]} nums
# @param {Integer} m
# @return {Boolean}
# Link: https://leetcode.com/problems/check-if-it-is-possible-to-split-array/description/
def can_split_array(nums, m)
  n = nums.length
  @dp = Array.new(n){Array.new(n, nil)}

  for i in 0..n-1
    @dp[i][i] = true
  end

  check(nums, 0, n-1, m)
end

def check(nums, i, j, m)
  n = nums.length
  return @dp[i][j] if !@dp[i][j].nil?
  return false if j-i >= 1 && nums[i..j].sum < m && (i > 0 || j < n-1)

  @dp[i][j] = check(nums, i+1, j, m) || check(nums, i, j-1, m)
  return @dp[i][j]
end
