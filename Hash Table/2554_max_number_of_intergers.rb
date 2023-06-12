# @param {Integer[]} banned
# @param {Integer} n
# @param {Integer} max_sum
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-number-of-integers-to-choose-from-a-range-i/description/
def max_count(banned, n, max_sum)
  a = Hash.new
  for i in 0..banned.length-1
    a[banned[i]] = 1
  end

  j = 1
  curr = 0
  res = 0
  while(curr <= max_sum && j <= n)
    if a[j].nil? && curr + j <= max_sum
      curr += j
      res += 1
    end

    j += 1
  end

  res
end
