# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_distance(nums1, nums2)
  m, n = nums1.length, nums2.length
  i, j = 0, 0
  res = 0
  while(i < m && j < n)
    if nums1[i] > nums2[j]
      i += 1
    else
      if i <= j
        res = [res, j-i].max
      end
      j += 1
    end
  end

  res
end
