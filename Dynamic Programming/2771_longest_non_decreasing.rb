# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
# Link: https://leetcode.com/problems/longest-non-decreasing-subarray-from-two-arrays/description/
def max_non_decreasing_length(nums1, nums2)
  n = nums1.length
  c11, c12, c21, c22 = 0, 0, 0, 0
  dp1, dp2 = 1, 1
  res = 1

  for i in 1..n-1
    c11 = nums1[i] >= nums1[i-1] ? dp1 + 1 : 1
    c12 = nums2[i] >= nums1[i-1] ? dp1 + 1 : 1
    c21 = nums1[i] >= nums2[i-1] ? dp2 + 1 : 1
    c22 = nums2[i] >= nums2[i-1] ? dp2 + 1 : 1
    dp1 = [c11, c21].max
    dp2 = [c12, c22].max
    res = [res, dp1, dp2].max
  end

  res
end
