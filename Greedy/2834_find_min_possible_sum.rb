# @param {Integer} n
# @param {Integer} target
# @return {Integer}
# Link: https://leetcode.com/problems/find-the-minimum-possible-sum-of-a-beautiful-array/description/
def minimum_possible_sum(n, target)
  first_m = target/2
  modulo = 10**9 + 7

  if first_m >= n
    return (n*(n+1)/2) % modulo
  else
    need = n - first_m
    last = target + need - 1
    res = first_m * (first_m+1)/2 % modulo
    larger_sum = (last+target) * (last-target+1)/2 % modulo
    res += larger_sum
    res %= modulo

    return res
  end
end
