# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/minimum-index-of-a-valid-split/description/
def minimum_index(nums)
  max = 0
  n = nums.length
  a = Hash.new
  most_num = nil

  for i in 0..n-1
    a[nums[i]] = 0 if a[nums[i]].nil?
    a[nums[i]] += 1

    if a[nums[i]] > max
      most_num = nums[i]
      max = a[nums[i]]
    end
  end

  cnt_max = 0
  return -1 if max <= n/2

  for i in 0..n-2
    if nums[i] == most_num
      cnt_max += 1
    end

    return i if cnt_max * 2 > i+1 && (max-cnt_max)*2 > (n-i-1)
  end

  return -1
end
