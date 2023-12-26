# @param {Integer} n
# @return {Integer}
def integer_break(n)
  dp = Array.new(n+1, 0)
  dp[0] = 1
  dp[1] = 1

  return n-1 if n <= 3

  for i in 2..n
    if i >= 2
      for j in 1..i
        dp[i] = [dp[i], dp[i-j] * j].max
      end
    end
  end

  dp[n]
end
