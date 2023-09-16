# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/contest/biweekly-contest-113/problems/minimum-right-shifts-to-sort-the-array/
def minimum_right_shifts(nums)
  other = nums + nums
  n = nums.length
  return 0 if nums.sort == nums
  for i in 0..n-1
      return n-i if other[i..i+n-1].sort == other[i..i+n-1]
  end

  return -1
end
