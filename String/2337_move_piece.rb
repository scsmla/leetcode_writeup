# @param {String} start
# @param {String} target
# @return {Boolean}
# Link: https://leetcode.com/problems/move-pieces-to-obtain-a-string/description/
def can_change(start, target)
  n = start.length
  s_l = start.count('L')
  s_t = start.count('R')
  t_l = target.count('L')
  t_t = target.count('R')

  return false if s_l != t_l || s_t != t_t
  return false if start.gsub('_', '') != target.gsub('_','')

  s_l, s_t, t_l, t_t = 0, 0, 0, 0
  for i in 0..n-1
    s_l += 1 if start[i] == 'L'
    s_t += 1 if start[i] == 'R'
    t_l += 1 if target[i] == 'L'
    t_t += 1 if target[i] == 'R'

    return false if s_l > t_l || s_t < t_t
  end

  true
end
