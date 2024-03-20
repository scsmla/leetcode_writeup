# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
# Link: https://leetcode.com/problems/median-of-two-sorted-arrays/
def find_median_sorted_arrays(nums1, nums2)
  n = nums1.length
  m = nums2.length
  l = (n+m+1)/2
  r = (n+m+2)/2

  (get_kth(nums1, 0, nums2, 0, l) + get_kth(nums1, 0, nums2, 0, r)).to_f/2
end

def get_kth(num1, s_1, num2, s_2, k)
  if s_1 >= num1.length
    return num2[s_2+k-1]
  end

  if s_2 >= num2.length
    return num1[s_1+k-1]
  end

  return [num1[s_1], num2[s_2]].min if k == 1

  mid1 = 10**9
  mid2 = 10**9

  mid1 = num1[s_1+k/2-1] if s_1 + k / 2 - 1 < num1.length
  mid2 = num2[s_2+k/2-1] if s_2 + k / 2 - 1 < num2.length

  if mid1 < mid2
    get_kth(num1, s_1 + k/2, num2, s_2, k - k/2)
  else
    get_kth(num1, s_1, num2, s_2 + k/2, k - k/2)
  end
end
