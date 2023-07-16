# @param {Integer[][]} points
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-number-of-points-with-cost/description/
def max_points(points)
  m, n = points.length, points[0].length
  dp = Array.new(m){Array.new(n, -10**5)}

  for j in 0..n-1
    dp[m-1][j] = points[m-1][j]
  end

  for i in (m-2).downto(0)
    left = Array.new(n, -1)
    left[0] = dp[i+1][0]

    for k in 1..n-1
      left[k] = [left[k-1], dp[i+1][k] + k].max
    end

    right = Array.new(n, -1)
    right[n-1] = dp[i+1][n-1] - n + 1

    for k in (n-2).downto(0)
      right[k] = [right[k+1], dp[i+1][k] - k].max
    end

    for j in 0..n-1
      dp[i][j] = [left[j]-j, right[j]+j].max + points[i][j]
    end
  end

  dp[0].max
end
