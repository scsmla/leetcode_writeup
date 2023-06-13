# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
# Link: https://leetcode.com/problems/find-all-good-indices/description/
def good_indices(nums, k)
  n = nums.length
  de = Array.new(n, 1)
  inc = Array.new(n, 1)

  for i in 1..n-1
    if nums[i-1] >= nums[i]
      de[i] = de[i-1] + 1
    end
  end

  for i in (n-2).downto(0)
    if nums[i+1] >= nums[i]
      inc[i] = inc[i+1] + 1
    end
  end

  res = []
  for i in 1..n-2
    res.push(i) if inc[i+1] >= k && de[i-1] >= k
  end

  res
end
