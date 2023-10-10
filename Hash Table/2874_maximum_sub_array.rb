# @param {Integer[]} nums
# @return {Integer}
def maximum_triplet_value(nums)
  n = nums.length
  max_r = Array.new(n, 0)
  max_r[n-2] = nums[n-1]
  curr = nums[n-1]

  for i in (n-3).downto(1)
      curr = [curr, nums[i+1]].max
      max_r[i] =  curr
  end

  max_sub = Array.new(n, 0)
  max_so_far = nums[0]
  max_sub[1] = max_so_far - nums[1]
  max_so_far = [nums[0], nums[1]].max

  for i in 1..n-2
      max_sub[i] = max_so_far - nums[i]
      max_so_far = [nums[i], max_so_far].max
  end

  max = 0
  for i in 1..n-2
      max = [max, max_sub[i] * max_r[i]].max
  end

  max
end
