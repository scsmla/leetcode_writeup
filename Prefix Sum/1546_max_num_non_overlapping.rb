# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-number-of-non-overlapping-subarrays-with-sum-equals-target/description/
def max_non_overlapping(nums, target)
  n = nums.length
  p_sum = Array.new(n, 0)
  p_sum[0] = nums[0]

  for i in 1..n-1
    p_sum[i] = p_sum[i-1] + nums[i]
  end

  a = Hash.new
  a[0] = [-1]
  res = 0
  last = -1

  for i in 0..n-1
    need = p_sum[i] - target

    if !a[need].nil?
      t_idx = a[need].bsearch_index{|x| x >= last}

      if !t_idx.nil?
        res += 1
        last = i
      end
    end

    a[p_sum[i]] = [] if a[p_sum[i]].nil?
    a[p_sum[i]].push(i)
  end

  res
end
