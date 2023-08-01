# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/maximum-length-of-subarray-with-positive-product/description/
def get_max_len(nums)
  max = 0
  n = nums.length
  pos, neg = 0, 0

  for i in 0..n-1
    if nums[i] == 0
      pos = 0
      neg = 0
    elsif nums[i] > 0
      pos += 1
      neg = neg == 0 ? 0 : neg + 1
    else
      t = pos
      pos = neg == 0 ? 0 : neg + 1
      neg = t
      neg += 1
    end

    max  = [max, pos].max
  end

  max
end
