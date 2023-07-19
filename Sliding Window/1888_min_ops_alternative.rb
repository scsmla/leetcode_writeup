# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-number-of-flips-to-make-the-binary-string-alternating/
def min_flips(s)
  n = s.length
  s = s + s
  s1, s2 = '', ''

  for i in 0..2*n-1
    s1.concat((i % 2) == 0 ? '0' : '1')
    s2.concat((i % 2) == 0 ? '1' : '0')
  end

  ans_1 = 0
  ans_2 = 0
  ans = 10**9

  for i in 0..2*n-1
    ans_1 += 1 if s1[i] != s[i]
    ans_2 += 1 if s2[i] != s[i]

    if i >= n
      ans_1 -= 1 if s1[i-n] != s[i-n]
      ans_2 -= 1 if s2[i-n] != s[i-n]
    end

    ans = [ans, ans_1, ans_2].min if i >= n-1
  end

  ans
end
