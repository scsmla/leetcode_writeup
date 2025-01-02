# @param {String[]} words
# @param {Integer[][]} queries
# @return {Integer[]}
def vowel_strings(words, queries)
  n = queries.length
  m = words.length
  prefix_sum = Array.new(m+1, 0)
  curr = 0

  for i in 0..m-1
    curr += 1 if valid_string?(words[i])
    prefix_sum[i+1] = curr
  end

  res = []

  for j in 0..n-1
    s, e = queries[j]
    res << prefix_sum[e+1] - prefix_sum[s]
  end

  res
end

def valid_string?(str)
  return true if ['a', 'e', 'i', 'o', 'u'].include?(str[0]) &&
                 ['a', 'e', 'i', 'o', 'u'].include?(str[-1])

  false
end
