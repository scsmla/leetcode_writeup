# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def maximum_subarray_sum(nums, k)
  n = nums.length
  pos = Array.new(10**5+1, -1)
  curr_sum = 0
  max = 0
  dup = -1

  for i in 0..n-1
    curr_sum += nums[i]
    curr_sum -= nums[i-k] if i >= k
    dup = [dup, pos[nums[i]]].max

    if i - dup >= k
      max = [max, curr_sum].max
    end

    pos[nums[i]] = i
  end

  max
end
