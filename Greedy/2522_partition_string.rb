# @param {String} s
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/partition-string-into-substrings-with-values-at-most-k/description/
def minimum_partition(s, k)
  n = s.length
  i = 0
  curr = ""
  res = 0
  while(i < n)
    return -1 if s[i].to_i > k

    while (i < n && (curr + s[i]).to_i <= k)
      curr += s[i]
      i += 1
    end
    curr = ""
    res += 1
  end

  res
end
