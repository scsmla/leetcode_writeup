# @param {Integer} n
# @param {String[]} words
# @param {Integer[]} groups
# @return {String[]}
# Link: https://leetcode.com/problems/longest-unequal-adjacent-groups-subsequence-i/description/
def get_words_in_longest_subsequence(n, words, groups)
  n = words.length
  a = Hash.new

  res_idx_0 = []
  res = []
  curr = 1

  for i in 0..groups.length-1
    if groups[i] != curr
      res_idx_0 << i
      curr = groups[i]
    end
  end

  curr = 0
  res_idx_1 = []

  for i in 0..groups.length-1
    if groups[i] != curr
      res_idx_1 << i
      curr = groups[i]
    end
  end

  res_idx = res_idx_0.length >= res_idx_1.length ? res_idx_0 : res_idx_1

  for i in 0..res_idx.length-1
    res << words[res_idx[i]]
  end

  res
end
