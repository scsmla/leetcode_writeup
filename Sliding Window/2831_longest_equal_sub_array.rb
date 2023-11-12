# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Link: https://leetcode.com/problems/find-the-longest-equal-subarray/description/
def longest_equal_subarray(nums, k)
  i = 0
  count = Hash.new
  max = 0
  for j in 0..nums.length-1
    count[nums[j]] = 0 if count[nums[j]].nil?
    count[nums[j]] += 1
    max = [max, count[nums[j]]].max

    if j - i + 1 - max > k
      count[nums[i]] -= 1
      i += 1
    end
  end

  max
end
