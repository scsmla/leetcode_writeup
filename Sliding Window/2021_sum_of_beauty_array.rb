# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/sum-of-beauty-in-the-array/description/
def sum_of_beauties(nums)
  n = nums.length
  res = Array.new(n-2, 0)
  min_after = nums[2..n-1].min
  max_before = nums[0..0].max

  min_after = Array.new(n, 0)
  min_after[n-2] = nums[n-1]

  for i in (n-3).downto(1)
    min_after[i] = [min_after[i+1], nums[i+1]].min
  end

  for i in 1..n-2
    if nums[i] < min_after[i] && nums[i] > max_before
      res[i-1] = 2
    elsif nums[i] > nums[i-1] && nums[i] < nums[i+1]
      res[i-1] = 1
    end

    max_before = [max_before, nums[i]].max
  end

  res.sum
end
