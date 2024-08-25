# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
  n = nums.length
  curr = nums[0..k-1].sum
  max = curr.to_f/k

  for i in 0..n-1-k
    curr -= nums[i]
    curr += nums[i+k]
    max = [max, curr.to_f/k].max
  end

  max
end
