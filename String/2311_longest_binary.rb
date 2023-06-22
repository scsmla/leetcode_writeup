# @param {String} s
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/longest-binary-subsequence-less-than-or-equal-to-k/description/
def longest_subsequence(s, k)
  n = s.length
  cnt = 0
  pow = 1
  val = 0
  for i in (n-1).downto(0)
    break if val + pow > k

    if s[i] == '1'
      cnt += 1
      val += pow
    end

    pow <<= 1
  end
  s.count('0') + cnt
end
