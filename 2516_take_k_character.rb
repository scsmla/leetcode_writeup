# @param {String} s
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/take-k-of-each-character-from-left-and-right/description/
def take_characters(s, k)
  ca, cb, cc = 0, 0, 0
  n = s.length
  for i in 0..n-1
    ca += 1 if s[i] == 'a'
    cb += 1 if s[i] == 'b'
    cc += 1 if s[i] == 'c'
  end
  return -1 if ca < k || cb < k || cc < k
  i = n-1
  j = n-1
  ans = n
  while(i >= 0)
    ca -= 1 if s[i] == 'a'
    cb -= 1 if s[i] == 'b'
    cc -= 1 if s[i] == 'c'

    while(ca < k || cb < k || cc < k)
      break if j < 0
      ca += 1 if s[j] == 'a'
      cb += 1 if s[j] == 'b'
      cc += 1 if s[j] == 'c'
      j -= 1
    end
    ans = [ans, n-1+i-j].min
    i -= 1
  end

  ans
end
