# @param {Integer[]} nums
# @return {Integer}
# LinK: https://leetcode.com/problems/max-sum-of-a-pair-with-equal-sum-of-digits/description/
def maximum_sum(nums)
  a = Hash.new
  max = -1
  nums = nums.sort
  for i in 0..nums.length-1
    s_d = nums[i].to_s.split('').map{|x| x.to_i}.sum
    a[s_d] = [] if a[s_d].nil?
    a[s_d].push(nums[i])

    if a[s_d].length >= 2
      max = [a[s_d][-1] + a[s_d][-2], max].max
    end
  end

  max
end
