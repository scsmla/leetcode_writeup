# @param {String} word
# @return {Integer}
# Link: https://leetcode.com/problems/longest-substring-of-all-vowels-in-order/description/
def longest_beautiful_substring(word)
  max = 0
  count = Array.new{Array.new(1, 0)}
  n = word.length
  c = 1

  for i in 1..n-1
    if word[i] == word[i-1]
      c += 1
    else
      count << [word[i-1], c]
      c = 1
    end

    if i == n-1
      count << [word[i], c]
    end
  end

  for j in 0..count.length-5
    if count[j][0] == 'a' &&
       count[j+1][0] == 'e' &&
       count[j+2][0] == 'i' &&
       count[j+3][0] == 'o' &&
       count[j+4][0] == 'u'
      max = [max, count[j..j+4].map{|x| x[1]}.sum].max
    end
  end

  max
end
