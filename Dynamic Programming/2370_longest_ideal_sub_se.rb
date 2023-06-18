# @param {String} s
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/longest-ideal-subsequence/description/
def longest_ideal_string(s, k)
  chars = Array.new(26, 0)
  n = s.length
  chars[s[n-1].ord-97] += 1
  max = 0
  for i in (n-2).downto(0)
    l = s[i].ord - k < 97 ? 97 : s[i].ord-k
    r = s[i].ord + k > 122 ? 122 : s[i].ord + k

    for j in l..r
      chars[s[i].ord-97] = [chars[j-97], chars[s[i].ord-97]].max
    end

    chars[s[i].ord-97] += 1
    max = [max, chars[s[i].ord-97]].max
  end

  max
end
