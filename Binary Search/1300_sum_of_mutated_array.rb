# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}
# Link: https://leetcode.com/problems/sum-of-mutated-array-closest-to-target/description/
def find_best_value(arr, target)
  arr = arr.sort
  n = arr.length
  p_sum = Array.new(n, 0)
  curr = 0

  for i in 0..n-1
    curr += arr[i]
    p_sum[i] = curr
  end

  min = 10**9
  res = 0

  for j in 0..arr.max
    idx = arr.bsearch_index{|x| x > j}

    if idx.nil?
      less_sum = p_sum[-1]
      s = 0
    else
      s = n-idx

      if idx == 0
        less_sum = 0
      else
        less_sum = p_sum[idx-1]
      end
    end

    curr = less_sum + j * s

    if (curr - target).abs < min
      min = (curr - target).abs
      res = j
    end
  end

  res
end
