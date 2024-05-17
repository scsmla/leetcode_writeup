# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def minimum_added_integer(nums1, nums2)
  # nums1 = nums1.sort
  # nums2 = nums2.sort
  nums1_h = nums1.tally

  for x in -1000..1000
    curr = nums2.dup

    for j in 0..nums2.length-1
      curr[j] -= x
    end

    curr_h = curr.tally
    is_valid = true

    curr_h.each do |k, v|
      if nums1_h[k].nil? || curr_h[k] > nums1_h[k]
        is_valid = false
        break
      end
    end

    return x if is_valid
  end
end
