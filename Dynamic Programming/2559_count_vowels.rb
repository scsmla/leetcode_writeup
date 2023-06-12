# @param {String[]} words
# @param {Integer[][]} queries
# @return {Integer[]}
# Link: https://leetcode.com/problems/count-vowel-strings-in-ranges/description/
def vowel_strings(words, queries)
  m, n = words.length, queries.length

  p_sum = Array.new(m+1, 0)
  vowels = ['u', 'e', 'o', 'a', 'i']

  for i in 0..m-1
    if vowels.include?(words[i][0]) && vowels.include?(words[i][-1])
      p_sum[i+1] = p_sum[i] + 1
    else
      p_sum[i+1] = p_sum[i]
    end
  end

  res = Array.new(n, 0)

  for i in 0..n-1
    s, e = queries[i]
    res[i] = p_sum[e+1] - p_sum[s]
  end

  res
end
