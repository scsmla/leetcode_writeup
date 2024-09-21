# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/longest-subarray-with-maximum-bitwise-and/description/
def longest_subarray(nums)
  n = nums.length
  max = 1
  curr = 1
  curr_max = nums[0]

  for i in 1..n-1
    if nums[i] == nums[i-1]
      curr += 1
    else
      curr = 1
    end

    if curr_max <= nums[i]
      if nums[i] > curr_max
        curr_max = nums[i]
        max = curr
      end

      max = [max, curr].max
    end
  end

  max
end
