# @param {Integer[]} nums
# @return {Float}
def minimum_average(nums)
  nums = nums.sort
  avg = []

  for i in 0..nums.length/2
    avg << (nums[i] + nums[nums.length-1-i]).to_f/2
  end

  avg.min
end
