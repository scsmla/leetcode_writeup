# @param {Integer} n
# @param {Integer[][]} offers
# @return {Integer}
# Link: https://leetcode.com/problems/maximize-the-profit-as-the-salesman/description/
def maximize_the_profit(n, offers)
  dp = Array.new(n+1, 0)
  a = Hash.new

  for i in 0..offers.length-1
    a[offers[i][1]] = [] if a[offers[i][1]].nil?
    a[offers[i][1]] << offers[i]
  end

  for i in 1..n
    dp[i] = dp[i-1]
    next if a[i-1].nil?
    for j in 0..a[i-1].length-1
      s, e, g = a[i-1][j]
      dp[i] = [dp[i], dp[s] + g].max
    end
  end

  dp[n]
end
