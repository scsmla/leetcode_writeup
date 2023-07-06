# @param {String} word
# @return {Integer}
# Link: https://leetcode.com/problems/vowels-of-all-substrings/description/
def count_vowels(word)
  n = word.length
  res = 0
  for i in 0..n-1
    if 'aeiou'.include?(word[i])
      res += (i+1) * (n-i)
    end
  end

  res
end
