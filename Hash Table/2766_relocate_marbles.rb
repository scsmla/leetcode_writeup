# @param {Integer[]} nums
# @param {Integer[]} move_from
# @param {Integer[]} move_to
# @return {Integer[]}
# Link: https://leetcode.com/problems/relocate-marbles/description/
def relocate_marbles(nums, move_from, move_to)
  n = nums.length
  m = move_from.length
  a = Hash.new

  for i in 0..n-1
    a[nums[i]] = 1 if a[nums[i]].nil?
  end

  for i in 0..m-1
    a[move_from[i]] = 0
    a[move_to[i]] = 1
  end

  res = []

  a.each do |k, v|
    res << k if v > 0
  end

  res.sort
end
