# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-absolute-sum-difference/
def min_absolute_sum_diff(nums1, nums2)
  sort_nums1 = nums1.sort
  n = nums1.length
  sum_diff = 0

  for i in 0..n-1
    sum_diff += (nums1[i] - nums2[i]).abs
  end

  min = sum_diff

  for i in 0..n-1
    before_sum = sum_diff - (nums1[i] - nums2[i]).abs
    greater_idx = sort_nums1.bsearch_index{|x| x >= nums2[i]}

    if greater_idx.nil?
      before_sum += (sort_nums1[-1] - nums2[i]).abs
    elsif greater_idx == 0
      before_sum += (sort_nums1[0] - nums2[i]).abs
    else
      min_diff = [(sort_nums1[greater_idx] - nums2[i]).abs, (sort_nums1[greater_idx-1] - nums2[i]).abs].min
      before_sum += min_diff
    end

    min = [min, before_sum].min
  end

  min % (10**9+7)
end
