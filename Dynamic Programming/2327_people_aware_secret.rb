# @param {Integer} n
# @param {Integer} delay
# @param {Integer} forget
# @return {Integer}
# Link: https://leetcode.com/problems/number-of-people-aware-of-a-secret/description/
def people_aware_of_secret(n, delay, forget)
  dp = Array.new(n+1, 0)
  dp[1] = 1
  mod = 10**9 + 7

  for i in 1..n
    next if dp[i] == 0
    j = i + delay
    while(j <= n)
      break if j - i >= forget
      dp[j] += dp[i]
      dp[j] %= mod
      j += 1
    end
  end

  ans = 0

  for i in n.downto(n-forget+1)
    ans += dp[i]
    ans %= mod
  end

  ans
end
