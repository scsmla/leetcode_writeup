# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/house-robber-iv/
def min_capability(nums, k)
  n = nums.length
  left = nums.min
  right = nums.max

  while(left < right)
    mid = (left+right)/2
    last = -2
    curr = 0
    for i in 0..nums.length-1
      if i - last >= 2 && nums[i] <= mid
        curr += 1
        last = i
      end
      break if curr >= k
    end

    if curr >= k
      right = mid
    else
      left = mid+1
    end
  end

  left
end
