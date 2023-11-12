# @param {Integer} n
# @param {Integer} k
# @return {Integer}
# LinkL https://leetcode.com/problems/determine-the-minimum-sum-of-a-k-avoiding-array/description/
def minimum_sum(n, target)
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
