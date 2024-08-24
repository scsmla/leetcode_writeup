# @param {Integer[]} nums
# @return {Boolean}
def can_alice_win(nums)
  sum_single = nums.select{|x| x <= 9}.sum

  return sum_single != nums.sum - sum_single
end
