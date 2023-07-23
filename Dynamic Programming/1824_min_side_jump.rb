# @param {Integer[]} obstacles
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-sideway-jumps/description/
def min_side_jumps(obstacles)
  dp = [1, 0, 1]

  for i in 0..obstacles.length-1
    x = obstacles[i]

    if x > 0
      dp[x-1] = 10**9
    end

    for j in 0..2
      if j + 1 != x
        dp[j] = [dp[j], [dp[(j+1) % 3], dp[(j+2) %3]].min+1].min
      end
    end
  end

  dp.min
end
