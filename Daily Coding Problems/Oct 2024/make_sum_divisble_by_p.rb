# @param {Integer[]} nums
# @param {Integer} p
# @return {Integer}
def min_subarray(nums, k)
  n = nums.length
  last = Hash.new
  curr = 0
  min = n+1
  global_need = nums.sum % k

  return 0 if global_need == 0

  for i in 0..n-1
    curr += nums[i]

    if curr % k == global_need && i < n-1
      min = [min, i+1].min
    end

    need = [k + (curr % k) - global_need, curr % k - global_need].max % k

    if !last[need].nil?
      min = [min, i - last[need]].min
    end

    last[curr % k] = i
  end

  min == n + 1 ? -1 : min
end
