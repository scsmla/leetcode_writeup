# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
# Link: https://leetcode.com/problems/number-of-ways-where-square-of-number-is-equal-to-product-of-two-numbers/description/
def num_triplets(nums1, nums2)
  a1, a2 = Hash.new, Hash.new

  for i in 0..nums1.length-1
    key = nums1[i] * nums1[i]
    a1[key] = 0 if a1[key].nil?
    a1[key] += 1
  end

  for i in 0..nums2.length-1
    key = nums2[i] * nums2[i]
    a2[key] = 0 if a2[key].nil?
    a2[key] += 1
  end

  res = 0

  for i in 0..nums1.length-1
    for j in 0..i-1
      curr = nums1[i] * nums1[j]

      if !a2[curr].nil?
        res += a2[curr]
      end
    end
  end

  for i in 0..nums2.length-1
    for j in 0..i-1
      curr = nums2[i] * nums2[j]

      if !a1[curr].nil?
        res += a1[curr]
      end
    end
  end

  res
end
