# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, s)
  hash1 = Hash.new
  hash2 = Hash.new
  words = s.split(' ')
  return false if pattern.length != words.length

  for i in 0..pattern.length-1
    return false if !hash1[pattern[i]].nil? && (hash1[pattern[i]] != words[i] || hash2[words[i]] != pattern[i])
    hash1[pattern[i]] = words[i]
    hash2[words[i]] = pattern[i]
  end

  true
end
