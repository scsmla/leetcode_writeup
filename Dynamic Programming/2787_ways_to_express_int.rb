# @param {Integer} n
# @param {Integer} x
# @return {Integer}
# Link: https://leetcode.com/problems/ways-to-express-an-integer-as-sum-of-powers/description/
def number_of_ways(n, x)
  nums = []
  i = 1

  while(i ** x <= n)
    nums << i ** x
    i += 1
  end
  m = nums.length

  dp = Array.new(n+1, 0)
  dp[0] = 1
  modulo = 10 ** 9 + 7

  for j in 0..m-1
    for i in n.downto(nums[j])
      dp[i] = (dp[i] + dp[i - nums[j]]) % modulo
    end
  end

  dp[n] % modulo
end
