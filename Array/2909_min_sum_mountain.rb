# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-sum-of-mountain-triplets-ii/
def minimum_sum(nums)
  n = nums.length
  min_to_left = Array.new(n, 0)
  min_to_right = Array.new(n, 0)

  curr = 10**10

  for i in 1..n-1
    curr = [curr, nums[i-1]].min
    min_to_left[i-1] = curr
  end

  curr = 10**10
  min_to_right[-1] = curr

  for i in (n-2).downto(0)
    curr = [curr, nums[i+1]].min
    min_to_right[i+1] = curr
  end

  min = 10**10

  for i in 1..n-2
    if nums[i] > min_to_left[i-1] && nums[i] > min_to_right[i+1]
      min = [min, nums[i] + min_to_left[i-1] + min_to_right[i+1]].min
    end
  end

  min == 10 ** 10 ? -1 : min
end
