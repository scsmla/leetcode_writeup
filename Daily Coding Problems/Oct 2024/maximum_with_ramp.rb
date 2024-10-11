# @param {Integer[]} nums
# @return {Integer}
def max_width_ramp(nums)
  n = nums.length
  stack = []
  max_ramp = 0

  for i in 0..n-1
    if stack.empty? || nums[stack[-1]] > nums[i]
      stack.push(i)
    end
  end

  for i in (n-1).downto(0)
    while(!stack.empty? && nums[stack[-1]] <= nums[i])
      max_ramp = [max_ramp, i - stack[-1]].max
      stack.pop
    end
  end

  max_ramp
end
