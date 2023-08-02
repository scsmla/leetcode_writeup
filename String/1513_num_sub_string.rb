# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/number-of-substrings-with-only-1s/description/
def num_sub(s)
  n = s.length
  res = 0
  curr = 0
  for i in 0..n-1
    if s[i] == '1'
      curr += 1
    else
      res += (curr)*(curr+1)/2
      curr = 0
    end
  end

  res += (curr)*(curr+1)/2
  res % (10**9+7)
end
