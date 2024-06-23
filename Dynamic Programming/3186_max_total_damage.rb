# @param {Integer[]} power
# @return {Integer}
def maximum_total_damage(power)
  n = power.length
  power = power.sort
  dp = Array.new(n+1, 0)
  j = 0
  max_curr = 0

  for i in 0..n-1
    if power[i] == power[[i-1, 0].max]
      dp[i+1] = dp[i] + power[i]
    else
      while(power[j] + 2 < power[i])
        j += 1
        max_curr = [dp[j], max_curr].max
      end

      dp[i+1] = max_curr + power[i]
    end
  end

  dp.max
end
