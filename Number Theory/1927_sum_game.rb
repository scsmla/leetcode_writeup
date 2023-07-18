# @param {String} num
# @return {Boolean}
# Link: https://leetcode.com/problems/sum-game/
def sum_game(num)
  res = 0
  n = num.length
  for i in 0..n-1
    res += (i < n/2 ? 1 : -1) * (num[i] == '?' ? 4.5 : num[i].to_i)
  end

  res != 0
end
