# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  n = nums.length
  l = 0
  r = n-1

  while(l < r)
    mid = (l+r)/2

    if nums[mid] >= nums[l] && nums[mid] <= nums[r]
      pivot = l
      break
    elsif nums[mid] >= nums[l] && nums[mid] >= nums[r]
      l = mid+1
    else
      r = mid
    end
  end

  pivot = l
  l = 0
  r = n-1

  while(l < r)
    mid = (l+r)/2

    return -1 if target > nums[(r+pivot) %n] || target < nums[(l+pivot) %n]
    return (mid+pivot) % n if target == nums[(mid+pivot) %n]

    if target < nums[(mid+pivot) % n]
      r = mid-1
    else
      l = mid+1
    end
  end

  return (l+pivot) % n if nums[(l+pivot) % n] == target

  return -1
end
