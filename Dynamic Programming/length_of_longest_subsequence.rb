# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# Link: https://leetcode.com/contest/biweekly-contest-116/problems/length-of-the-longest-subsequence-that-sums-to-target/

def length_of_longest_subsequence(nums, target)
  nums = nums.sort
  nums = nums.select{|x| x <= target}
  n = nums.length

  dp = Array.new(target+1, -1)
  dp[0] = 0

  for i in 0..n-1
      for j in target.downto(1)
          if j >= nums[i]
              if dp[j-nums[i]] != -1
                  dp[j] = [dp[j-nums[i]] + 1, dp[j]].max
              end
          end
      end
  end

  dp[target]
end
