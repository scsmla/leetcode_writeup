# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer[]}
# Link: https://leetcode.com/problems/the-k-strongest-values-in-an-array/description/
def get_strongest(arr, k)
  n = arr.length
  arr = arr.sort
  median = arr[(n-1)/2]
  arr = arr.sort_by{|x| (x-median).abs}.reverse
  arr[0..k-1]
end
