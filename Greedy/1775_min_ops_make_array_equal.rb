# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
# Link: https://leetcode.com/problems/equal-sum-arrays-with-minimum-number-of-operations/description/
def min_operations(nums1, nums2)
  s1 = nums1.sum
  s2 = nums2.sum
  return -1 if nums2.length * 1 > nums1.length * 6 || nums1.length * 1 > nums2.length * 6

  nums1, nums2 = nums2, nums1 if s1 > s2
  cnt = Array.new(6, 0)

  for i in 0..nums1.length-1
    cnt[6-nums1[i]] += 1
  end

  for i in 0..nums2.length-1
    cnt[nums2[i]-1] += 1
  end

  diff = (s1-s2).abs
  res = 0

  for i in 5.downto(1)
    break if diff < 0
    need = [cnt[i], (diff.to_f/i).ceil].min
    diff -= need * i
    res += need
  end

  res
end
