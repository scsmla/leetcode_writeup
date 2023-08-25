# @param {Integer[]} arr
# @param {Integer} difference
# @return {Integer}
# Link: https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference/description/
def longest_subsequence(arr, difference)
  a = Hash.new
  n = arr.length
  max = 0

  for i in 0..n-1
    if !a[arr[i] - difference].nil?
      a[arr[i]] = a[arr[i] - difference] + 1
    else
      a[arr[i]] = 1
    end

    max = [a[arr[i]], max].max
  end

  max
end
