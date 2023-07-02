# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-swaps-to-group-all-1s-together-ii/description/
def min_swaps(nums)
  c_1 = nums.sum
  nums = nums + nums
  curr, m_c_1 = 0, 0

  for i in 0..nums.length-1
    curr -= 1 if i >= c_1 && nums[i-c_1] == 1
    curr += 1 if nums[i] == 1
    m_c_1 = [m_c_1, curr].max
  end

  c_1 - m_c_1
end
