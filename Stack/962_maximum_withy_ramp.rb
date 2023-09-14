# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-width-ramp/
def max_width_ramp(nums)
  min = 10**9
  res = 0
  stack = []

  for i in 0..nums.length-1
    if stack.empty? || nums[stack[-1]] > nums[i]
      stack.push(i)
    end
  end

  for i in (nums.length-1).downto(0)
    while(!stack.empty? && nums[stack[-1]] <= nums[i])
      res = [i - stack[-1], res].max
      stack.pop
    end
  end

  res
end
