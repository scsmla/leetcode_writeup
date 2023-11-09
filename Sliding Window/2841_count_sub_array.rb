# @param {Integer[]} nums
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
# LinK: https://leetcode.com/problems/maximum-sum-of-almost-unique-subarray/
def max_sum(nums, m, k)
  n = nums.length
  max = 0
  a = Hash.new

  for i in 0..k-1
    a[nums[i]] = 0 if a[nums[i]].nil?
    a[nums[i]] += 1
  end

  curr_sum = nums[0..k-1].sum

  if a.keys.length >= m
    max = [max, curr_sum].max
  end


  for i in k..n-1
    a[nums[i-k]] -= 1
    a.delete(nums[i-k]) if a[nums[i-k]] == 0
    a[nums[i]] = 0 if a[nums[i]].nil?
    a[nums[i]] += 1
    curr_sum -= nums[i-k]
    curr_sum += nums[i]

    if a.keys.length >= m
      max = [max, curr_sum].max
    end
  end

  max
end
