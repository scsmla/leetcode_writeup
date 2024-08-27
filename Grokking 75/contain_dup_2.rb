# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  hash = Hash.new

  for i in 0..nums.length-1
    hash[nums[i]] ||= []
    hash[nums[i]] << i
    return true if hash[nums[i]].length > 1 && hash[nums[i]][-1] - hash[nums[i]][-2] <= k
  end

  false
end
