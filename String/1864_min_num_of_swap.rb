# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-binary-string-alternating/description/
def min_swaps(s)
  c_0 = s.count('0')
  c_1 = s.count('1')
  return -1 if (c_0 - c_1).abs > 1

  n = s.length

  if c_0 == c_1
    s1, s2 = '', ''

    for i in 0..n-1
      s1 += (i % 2) == 0 ? '0': '1'
      s2 += (i % 2) == 1 ? '0': '1'
    end
    ans = 10**5
    ans1, ans2 = 0, 0

    for i in 0..n-1
      ans1 += 1 if s1[i] != s[i]
      ans2 += 1 if s2[i] != s[i]
    end

    ans = [ans, ans1/2, ans2/2].min

  elsif c_0 > c_1
    target = ''
    for i in 0..n-1
      target += (i % 2) == 0 ? '0': '1'
    end

    ans = 10**5
    ans1 = 0
    for i in 0..n-1
      ans1 += 1 if target[i] != s[i]
    end

    ans = [ans, ans1/2].min
  else
    target = ''
    for i in 0..n-1
      target += (i % 2) == 0 ? '1': '0'
    end

    ans = 10**5
    ans1 = 0
    for i in 0..n-1
      ans1 += 1 if target[i] != s[i]
    end

    ans = [ans, ans1/2].min
  end

  ans
end
