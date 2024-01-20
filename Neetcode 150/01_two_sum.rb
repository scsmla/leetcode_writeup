# Link: https://leetcode.com/problems/two-sum/description/

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  a = Hash.new
  n = nums.length

  for i in 0..n-1
    a[nums[i]] = [] if a[nums[i]].nil?
    a[nums[i]] << i
  end

  for i in 0..n-1
    if target == nums[i] * 2
      return a[target/2][0..1] if a[target/2].length >= 2
    else
      return [i, a[target-nums[i]][0]] if !a[target-nums[i]].nil?
    end
  end
end
