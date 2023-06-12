# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-operations-to-make-array-equal-ii/description/
def min_operations(nums1, nums2, k)
  n = nums1.length
  p_ops = 0
  n_ops = 0
  for i in 0..n-1
    n1, n2 = nums1[i], nums2[i]
    next if n1 == n2
    if k == 0
      if n1 != n2
        return -1
      else
        next
      end
    else
      return -1 if (n1-n2).abs % k != 0
    end
    if n1 > n2
      p_ops += (n1-n2)/k
    else
      n_ops += (n2-n1)/k
    end
  end

  p_ops == n_ops ? p_ops : -1
end
