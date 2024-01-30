# @param {String} s
# @return {Integer}
# Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
def length_of_longest_substring(s)
  n = s.length
  count = Hash.new
  max = 0
  j = 0

  for i in 0..n-1
    count[s[i]] = 0 if count[s[i]].nil?
    count[s[i]] += 1

    if count[s[i]] >= 2
      while(j < i && count[s[i]].to_i >= 2)
        count[s[j]] -= 1
        j += 1
      end
    end

    max = [i-j+1, max].max
  end

  max
end
