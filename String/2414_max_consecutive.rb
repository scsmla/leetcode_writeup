# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/length-of-the-longest-alphabetical-continuous-substring/description/
def longest_continuous_substring(s)
  max = 1
  n = s.length
  i = 1
  while(i < n)
    if s[i].ord - s[i-1].ord == 1
      first = i-1
      while(i < n && s[i].ord - s[i-1].ord == 1)
        i += 1
      end

      max = [i - first, max].max
    else
      i += 1
    end
  end

  max
end
