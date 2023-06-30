# @param {Integer[]} nums
# @return {Integer}
# Link https://leetcode.com/problems/minimum-deletions-to-make-array-beautiful/description/
def min_deletion(nums)
  ans = 0
  for i in 0..nums.length-2
    ans += 1 if nums[i] == nums[i+1] && (i-ans) % 2 == 0
  end

  ans + (nums.length-ans)%2
end
