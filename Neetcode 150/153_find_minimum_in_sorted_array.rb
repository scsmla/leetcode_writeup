# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/
def find_min(nums)
  n = nums.length
  l = 0
  r = n-1
  return nums[0] if n == 1

  while(l < r)
    mid = (l+r)/2

    if nums[mid] >= nums[l] && nums[mid] <= nums[r]
      return nums[l]
    elsif nums[mid] >= nums[l] && nums[mid] >= nums[r]
      l = mid+1
    else
      r = mid
    end
  end

  return nums[l]
end
