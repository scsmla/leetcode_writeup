# @param {String} s
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/longest-repeating-character-replacement/description/
def character_replacement(s, k)
  n = s.length
  max = 0
  a = Hash.new
  j = 0
  count_max = 0

  for i in 0..n-1
    a[s[i]] = 0 if a[s[i]].nil?
    a[s[i]] += 1

    count_max = [count_max, a[s[i]]].max

    if i - j + 1 - count_max > k
      while(j <= i && i - j + 1 - count_max) > k
        a[s[j]] -= 1
        j += 1
      end
    end

    max = [max, i-j+1].max
  end

  max
end
