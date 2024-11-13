# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def count_fair_pairs(nums, lower, upper)
  nums = nums.sort
  n = nums.length
  res = 0

  for i in 0..n-1
    curr = nums[i]

    need_1 = lower - curr
    need_2 = upper - curr

    next if need_2 < curr

    lower_idx = nums.bsearch_index{|x| x >= need_1}
    upper_idx = nums.bsearch_index{|x| x > need_2}
    upper_idx = n if upper_idx.nil?
    lower_idx = n if lower_idx.nil?

    # puts lower_idx
    # puts upper_idx
    res += (upper_idx - [lower_idx, i+1].max)
  end

  res
end
