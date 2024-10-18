# @param {String} s
# @param {String} t
# @return {Boolean}
# Time complexity: O(nlogn)
# Space complexity: O(1)
def is_anagram(s, t)
  s.chars.sort == t.chars.sort
end


# @param {String} s
# @param {String} t
# @return {Boolean}
# Time complexity: O(n)
# Space complexity: O(n)
def is_anagram(s, t)
  return false if s.length != t.length

  s_char = Hash.new
  t_char = Hash.new

  for i in 0..s.length-1
    s_char[s[i]] ||= 0
    t_char[t[i]] ||= 0
    s_char[s[i]] += 1
    t_char[t[i]] += 1
  end

  ('a'..'z').to_a.each do |char|
    return false if s_char[char] != t_char[char]
  end

  true
end
