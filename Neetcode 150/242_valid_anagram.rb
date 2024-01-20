# Link: https://leetcode.com/problems/valid-anagram/description/

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  m, n = s.length, t.length
  return false if m != n

  a, b = Hash.new, Hash.new

  for i in 0..m-1
    a[s[i]] = 0 if a[s[i]].nil?
    a[s[i]] += 1
    b[t[i]] = 0 if b[t[i]].nil?
    b[t[i]] += 1
  end

  # print a
  # print b
  a.each do |k, _|
    return false if a[k] != b[k]
  end

  true
end
