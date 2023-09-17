# @param {Integer[]} nums
# @return {Boolean}
# Link: https://leetcode.com/problems/non-decreasing-array/
def check_possibility(nums)
  n = nums.length
  return true if n == 1

  for i in 1..n-1
    break if nums[i] < nums[i-1]
  end

  if i > 1
    if nums[i] >= nums[i-2]
      nums[i-1] = nums[i]
    else
      nums[i] = nums[i-1]
    end
  else
    nums[i-1] = -10**5
  end

  for i in 1..n-1
    break if nums[i] < nums[i-1]
  end

  return false if i < n-1

  nums[-1] < nums[-2] ? false : true
end
