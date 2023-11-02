# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-equal-sum-of-two-arrays-after-replacing-zeros/description/
def min_sum(nums1, nums2)
  sum1 = nums1.sum
  sum2 = nums2.sum
  c1 = nums1.count(0)
  c2 = nums2.count(0)

  if c1 == 0
    return -1 if sum1 < sum2 || sum1 < sum2 + c2
  end

  if c2 == 0
    return -1 if sum2 < sum1 || sum2 < sum1 + c1
  end

  return [sum1 + c1, sum2 + c2].max
end
