# @param {Integer[]} nums
# @param {Integer} limit
# @return {Integer}
# Link: https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/description/
def longest_subarray(nums, limit)
  n = nums.length
  max = []
  min = []
  l = 0
  res = 0

  for r in 0..n-1
    while(!max.empty? && max[-1] < nums[r])
      max.pop
    end
    max.push(nums[r])

    while(!min.empty? && min[-1] > nums[r])
      min.pop
    end
    min.push(nums[r])

    while(max[0] - min[0] > limit)
      max.shift if max[0] == nums[l]
      min.shift if min[0] == nums[l]

      l += 1
    end

    res = [r-l+1, res].max
  end

  res
end
