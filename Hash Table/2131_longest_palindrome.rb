# @param {String[]} words
# @return {Integer}
# Link: https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/description/
def longest_palindrome(words)
  a = Hash.new

  for i in 0..words.length-1
    a[words[i]] = 0 if a[words[i]].nil?
    a[words[i]] += 1
  end

  res = 0
  p_1 = false
  a.each do |k, v|
    if k.reverse != k
      if a[k.reverse].to_i > 0
        min = [a[k], a[k.reverse]].min
        res += 2*min
        a[k] -= min
        a[k.reverse] -= min
      end
    else
      if a[k] % 2 == 0
        res += a[k]
      else
        res += a[k]-1
        if p_1 == false
          p_1 = true
          res += 1
        end
      end
    end
  end

  res*2
end
