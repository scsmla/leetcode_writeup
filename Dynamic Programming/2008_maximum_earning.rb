# @param {Integer} n
# @param {Integer[][]} rides
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-earnings-from-taxi/description/
def max_taxi_earnings(n, rides)
  e_p = Hash.new
  for i in 0..rides.length-1
    s, e, t = rides[i]
    e_p[e] = [] if e_p[e].nil?
    e_p[e] << [s, e-s+t]
  end

  dp = Array.new(n+1, 0)

  for i in 1..n
    dp[i] = dp[i-1]
    next if e_p[i].nil?
    for j in 0..e_p[i].length-1
      s, t = e_p[i][j]
      dp[i] = [dp[i], t + dp[s]].max
    end
  end

  dp[-1]
end
