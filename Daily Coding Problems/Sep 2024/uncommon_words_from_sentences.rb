# @param {String} s1
# @param {String} s2
# @return {String[]}
def uncommon_from_sentences(s1, s2)
  hash1 = Hash.new
  hash2 = Hash.new
  res = []

  s1.split(' ').each do |word|
   hash1[word] ||= 0
   hash1[word] += 1
  end

  s2.split(' ').each do |word|
   hash2[word] ||= 0
   hash2[word] += 1
  end

  hash1.each do |k, v|
   res << k if hash2[k].nil? && v == 1
  end

  hash2.each do |k, v|
   res << k if hash1[k].nil? && v == 1
  end

  res
end
