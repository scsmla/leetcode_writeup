# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
# Link: https://leetcode.com/problems/interleaving-string/
def is_interleave(s1, s2, s3)
  m, n, t = s1.length, s2.length, s3.length
  return false if m + n != t

  dp = Array.new(m+1){Array.new(n+1, false)}

  for i in 0..m
    for j in 0..n
      if i == 0 && j == 0
        dp[i][j] = true
      elsif i == 0
        dp[i][j] = dp[i][j-1] && (s2[j-1] == s3[i+j-1])
      elsif j == 0
        dp[i][j] = dp[i-1][j] && (s1[i-1] == s3[i+j-1])
      else
        dp[i][j] = (dp[i][j-1] && (s2[j-1] == s3[i+j-1])) || (dp[i-1][j] && (s1[i-1] == s3[i+j-1]))
      end
    end
  end

  dp[m][n]
end
