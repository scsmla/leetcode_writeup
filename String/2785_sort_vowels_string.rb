# @param {String} s
# @return {String}
# Link: https://leetcode.com/problems/sort-vowels-in-a-string/description/
def sort_vowels(s)
  vowels = []

  for i in 0..s.length-1
    if 'aeiou'.include?(s[i]) || 'AEIOU'.include?(s[i])
      vowels << s[i]
      s[i] = ' '
    end
  end

  vowels = vowels.sort

  for i in 0..s.length-1
    if s[i] == ' '
      s[i] = vowels.shift
    end
  end

  s
end
