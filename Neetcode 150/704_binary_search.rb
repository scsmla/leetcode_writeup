# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  n = nums.length
  l = 0
  r = n-1
  while(l <= r)
    mid = (l+r)/2

    return mid if nums[mid] == target
    if nums[mid] < target
      l = mid + 1
    else
      r = mid - 1
    end
  end

  -1
end
