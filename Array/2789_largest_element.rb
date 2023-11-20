# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/largest-element-in-an-array-after-merge-operations/description/
def max_array_value(nums)
  n = nums.length
  curr = nums[-1]
  max = nums[-1]

  for i in (n-2).downto(0)
    if nums[i] <= curr
      curr += nums[i]
    else
      curr = nums[i]
    end

    max = [curr, max].max
  end

  max
end
