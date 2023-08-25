# @param {String} s
# @param {String} t
# @param {Integer} max_cost
# @return {Integer}
# Link: https://leetcode.com/problems/get-equal-substrings-within-budget/
def equal_substring(s, t, max_cost)
  n = s.length
  curr = 0
  j = 0
  max = 0

  for i in 0..n-1
    curr += (s[i].ord - t[i].ord).abs

    if curr > max_cost
      curr -= (s[j].ord - t[j].ord).abs
      j += 1
    else
      max = i-j+1
    end
  end

  max
end
