# @param {String} s
# @return {Integer}
# Time complexity: O(n)
# Space complexity: O(n)
def length_of_longest_substring(s)
  n = s.length
  max = 0
  count = Hash.new
  j = 0

  for i in 0..n-1
    count[s[i]] ||= 0
    count[s[i]] += 1
    if count[s[i]] >= 2
      while(j < i && count[s[i]] >= 2)
        count[s[j]] -= 1
        j += 1
      end
    end
    max = [max, i-j+1].max
  end

  max
end
