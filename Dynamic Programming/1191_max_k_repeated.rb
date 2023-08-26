# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/k-concatenation-maximum-sum/description/
def k_concatenation_max_sum(arr, k)
  sum = arr.sum
  mod = 10**9+7
  max_p = 0
  max_s = 0
  n = arr.length

  for i in 0..(n*([k, 2].min) - 1)
    max_s = [max_s + arr[i%n], arr[i%n]].max
    max_p = [max_p, max_s].max
  end

  return [[0, max_p].max, max_p + sum * [k-2, 0].max].max % mod
end
