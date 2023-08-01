# @param {Integer[]} arr
# @return {Integer}
# Link: https://leetcode.com/problems/shortest-subarray-to-be-removed-to-make-array-sorted/
def find_length_of_shortest_subarray(arr)
  n = arr.length
  l = 0
  r = n-1

  while(l+1 < n && arr[l] <= arr[l+1])
    l += 1
  end

  return 0 if l == n-1

  while(r > l && arr[r-1] <= arr[r])
    r -= 1
  end

  res = [n-1-l, r].min

  i = 0
  j = r
  while(i <= l && j < n)
    if arr[j] >= arr[i]
      res = [res, j-i-1].min
      i += 1
    else
      j += 1
    end
  end

  res
end
