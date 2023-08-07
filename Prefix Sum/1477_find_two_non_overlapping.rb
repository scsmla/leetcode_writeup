# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}
# Link: https://leetcode.com/problems/find-two-non-overlapping-sub-arrays-each-with-target-sum/description/
def min_sum_of_lengths(arr, target)
  l = 10**9
  res = 10**9
  n = arr.length
  curr = 0
  a = Hash.new

  for i in 0..n-1
    curr += arr[i]
    a[curr] = i
  end

  curr = 0
  a[0] = -1
  for i in 0..n-1
    curr += arr[i]

    if !a[curr-target].nil?
      l = [l, i-a[curr-target]].min
    end

    if !a[curr+target].nil? && l != 10**9
      res = [res, l + a[curr+target] - i].min
    end
  end

  res == 10**9 ? -1 : res
end
