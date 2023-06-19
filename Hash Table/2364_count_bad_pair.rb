# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/count-number-of-bad-pairs/description/
def count_bad_pairs(nums)
  a = Hash.new
  n = nums.length
  cnt = 0
  for i in 0..n-1
    a[nums[i]-i] = 0 if a[nums[i]-i].nil?
    cnt += a[nums[i]-i]
    a[nums[i]-i] += 1
  end

  n * (n-1)/2 - cnt
end
