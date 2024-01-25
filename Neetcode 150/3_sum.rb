# @param {Integer[]} nums
# @return {Integer[][]}
# Link: https://leetcode.com/problems/3sum/description/
def three_sum(nums)
  nums = nums.sort
  n = nums.length
  a = Hash.new

  for i in 0..n-1
    a[nums[i]] = [] if a[nums[i]].nil?
    a[nums[i]] << i
  end

  res = []

  for i in 0..n-1
    next if i > 0 && nums[i] == nums[i-1]

    for j in i+1..n-1
      curr = nums[i] + nums[j]
      need = -curr
      next if a[need].nil?
      if a[need][-1] > j
        res << [nums[i], nums[j], need]
      end
    end
  end

  res.uniq
end
