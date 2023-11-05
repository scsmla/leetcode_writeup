# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def min_size_subarray(nums, target)
  res = 0
  sum = nums.sum

  if target >= sum*2
    div = target/sum
    target -= sum*div
    res += div * nums.length
  end

  nums = nums + nums + nums
  curr = 0
  a = Hash.new
  min = 10**8
  a[0] = -1

  for i in 0..nums.length-1
    curr += nums[i]
    a[curr] = i
    if !a[curr-target].nil?
      min = [min, a[curr]-a[curr-target]].min
    end
  end

  min == 10 ** 8 ? -1 : res + min
end
