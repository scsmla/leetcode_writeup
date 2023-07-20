# @param {String} s
# @param {Integer} min_jump
# @param {Integer} max_jump
# @return {Boolean}
# Link: https://leetcode.com/problems/jump-game-vii/
def can_reach(s, min_jump, max_jump)
  return false if s[-1] != '0'

  n = s.length
  dp = Array.new(n, false)
  dp[0] = true
  check = 0

  for i in 1..n-1
    check += 1 if i >= min_jump && dp[i - min_jump]
    check -= 1 if i > max_jump && dp[i-max_jump-1]

    dp[i] = check > 0 && s[i] == '0'
  end

  dp[-1]
end
