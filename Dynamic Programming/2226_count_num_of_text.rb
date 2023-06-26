# @param {String} pressed_keys
# @return {Integer}
# Link: https://leetcode.com/problems/count-number-of-texts/description/
def count_texts(pressed_keys)
  n = pressed_keys.length
  dp = Array.new(n+1, 0)
  mod = 10**9+7

  dp[0] = 1

  for i in 1..n
    dp[i] = dp[i-1]

    if i >= 2 && pressed_keys[i-1] == pressed_keys[i-2]
      dp[i] += dp[i-2]
    end

    if i >= 3 && pressed_keys[i-1] == pressed_keys[i-2] && pressed_keys[i-2] == pressed_keys[i-3]
      dp[i] += dp[i-3]
    end

     if i >= 4 &&
      pressed_keys[i-1] == pressed_keys[i-2] &&
      pressed_keys[i-2] == pressed_keys[i-3] &&
      pressed_keys[i-3] == pressed_keys[i-4] &&
      ['7', '9'].include?(pressed_keys[i-1])
        dp[i] += dp[i-4]
    end
    dp[i] %= mod
  end

  dp[-1] % mod
end
