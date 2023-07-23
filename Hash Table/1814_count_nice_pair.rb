# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/count-nice-pairs-in-an-array/
def count_nice_pairs(nums)
  a = Hash.new

  for i in 0..nums.length-1
    key = nums[i] - nums[i].to_s.reverse.to_i
    a[key] = 0 if a[key].nil?
    a[key] += 1
  end

  res = 0

  a.each do |_, v|
    res += v*(v-1)/2
  end

  res % (10**9+7)
end
