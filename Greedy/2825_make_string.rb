# @param {String} str1
# @param {String} str2
# @return {Boolean}
# Link: https://leetcode.com/problems/make-string-a-subsequence-using-cyclic-increments/description/
def can_make_subsequence(str1, str2)
  return false if str1.length < str2.length

  i = 0
  j = 0

  while(i < str1.length && j < str2.length)
    if str2[j] == str1[i] || convert(str1[i]) == str2[j]
      i += 1
      j += 1
    else
      i += 1
    end
  end

  j >= str2.length
end

def convert(char)
  if char == 'z'
    return 'a'
  else
    return (char.ord + 1).chr
  end
end
