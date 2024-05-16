# @param {String} s
# @return {Integer}
def minimum_substrings_in_partition(s)
  n = s.length
  dp = Array.new(n+1, n+1)
  dp[0] = 0

  count_char = Array.new(n+1){Array.new(26, 0)}

  for i in 1..n
    for j in 0..25
      if j == s[i-1].ord-97
        count_char[i][j] = count_char[i-1][j] + 1
      else
        count_char[i][j] = count_char[i-1][j]
      end
    end
  end

  for i in 1..n
    for j in 0..i-1
      count = []
      valid = true

      for k in 0..25
        count << count_char[i][k] - count_char[j][k]
      end

      max = count.max

      for k in 0..25
        if count[k] > 0 && count[k] < max
          valid = false
          break
        end
      end

      if valid
        dp[i] = [dp[j] + 1, dp[i]].min
      end
    end
  end

  dp[n]
end
