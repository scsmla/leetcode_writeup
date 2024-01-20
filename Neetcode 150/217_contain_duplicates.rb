# Link: https://leetcode.com/problems/contains-duplicate/description/

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  a = Hash.new

  for i in 0..nums.length-1
    a[nums[i]] = 0 if a[nums[i]].nil?
    a[nums[i]] += 1

    return true if a[nums[i]] >= 2
  end

  false
end
