# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
# Link: https://leetcode.com/problems/count-the-number-of-fair-pairs/description/
def count_fair_pairs(nums, lower, upper)
  nums = nums.sort
  n = nums.length
  res = 0
  for i in 0..n-2
    l = lower - nums[i]
    u = upper - nums[i]
    l_idx = nums[i+1..-1].bsearch_index{|x| x >= l}
    u_idx = nums[i+1..-1].bsearch_index{|y| y > u}

    next if l_idx.nil?
    if l_idx == 0
      next if nums[0] + nums[i] > upper
    end
    if u_idx.nil?
      u_idx = n-2-i
    else
      u_idx -= 1
    end

    res += (u_idx-l_idx+1) if u_idx >= l_idx
  end

  res
end
