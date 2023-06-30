# @param {String} text
# @param {String} pattern
# @return {Integer}
# Link: https://leetcode.com/problems/maximize-number-of-subsequences-in-a-string/
def maximum_subsequence_count(text, pattern)
  res = 0
  c_0 = 0
  c_1 = 0

  for i in 0..text.length-1
    if text[i] == pattern[1]
      res += c_0
      c_1 += 1
    end

    if text[i] == pattern[0]
      c_0 += 1
    end
  end

    res + [c_0, c_1].max
end
