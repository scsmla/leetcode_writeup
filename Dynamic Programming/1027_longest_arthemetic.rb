# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/longest-arithmetic-subsequence/description/
def longest_arith_seq_length(nums)
  n = nums.length
  bucket = Array.new(n){Hash.new}
  max = 0

  for i in 0..n-1
    for j in 0..i-1
      diff = nums[i] - nums[j]
      bucket[i][diff] = bucket[j][diff].nil? ? 2 : bucket[j][diff] + 1
      max = [bucket[i][diff], max].max
    end
  end

  max
end
