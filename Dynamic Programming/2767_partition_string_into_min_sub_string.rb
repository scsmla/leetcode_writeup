# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/partition-string-into-minimum-beautiful-substrings/
def minimum_beautiful_substrings(s)
  all_5_pows = []

  for i in 0..6
    all_5_pows << (5**i).to_s(2)
  end

  n = s.length
  dp = Array.new(s.length, 100)
  dp << 0

  for i in 0..n-1
    for j in 0..all_5_pows.length-1
      m = all_5_pows[j].length
      next if i < m-1
      if s[i-m+1..i] == all_5_pows[j]

        dp[i] = [dp[i], dp[i-m] + 1].min
      end
    end
  end

  dp[n-1] == 100 ? -1 : dp[n-1]
end
