# @param {Integer[]} nums
# @param {Integer} threshold
# @return {Integer}
# Link: https://leetcode.com/problems/find-the-smallest-divisor-given-a-threshold/description/
def smallest_divisor(nums, threshold)
  nums = nums.sort
  n = nums.length
  l = 1
  r = nums[-1] + 1

  while(l < r)
    mid = (l+r)/2

    if valid(nums, threshold, mid)
      r = mid
    else
      l = mid + 1
    end
  end

  l
end

def valid(nums, threshold, target)
  curr = 0

  for i in 0..nums.length-1
    curr += (nums[i].to_f/target).ceil
  end

  curr <= threshold
end
