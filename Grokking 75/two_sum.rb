# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  n = nums.length
  a = Hash.new

  for i in 0..n-1
    a[nums[i]] ||= []
    a[nums[i]] << i
  end

  for i in 0..n-1
    if target % 2 == 0 && target/2 == nums[i]
      return a[nums[i]] if a[nums[i]].length >= 2
    else
      return [i, a[target - nums[i]][0]] if !a[target - nums[i]].nil?
    end
  end
end
