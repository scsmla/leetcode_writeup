# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/count-number-of-homogenous-substrings/description/
def count_homogenous(s)
  res = 0
  curr = 1
  at = Array.new(26, 0)

  for i in 1..s.length-1
    if s[i] == s[i-1]
      curr += 1
    else
      res += curr * (curr+1)/2
      curr = 1
    end
  end

  res += curr * (curr+1)/2

  res % (10**9+7)
end
