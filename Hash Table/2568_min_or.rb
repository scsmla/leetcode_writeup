# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-impossible-or/submissions/963695448/
def min_impossible_or(nums)
  a = Hash.new
  for i in 0..nums.length
    a[nums[i]] = 1
  end
  i = 1
  while(!a[i].nil?)
    i <<= 1
  end
  i
end
