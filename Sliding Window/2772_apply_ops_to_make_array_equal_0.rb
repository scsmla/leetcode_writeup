# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def check_array(nums, k)
  return true if k == 1

  n = nums.length
  i = 0
  need = Array.new(n, 0)
  curr = 0

  for i in 0..n-1
    if i < k
      if i > 0
        return false if nums[i] < nums[i-1]
        need[i] = nums[i] - nums[i-1]
      end
      curr += need[i]
      if i == k- 1
        nums[i] -= nums[i-1]
      end
    else
      return false if nums[i] < curr

      need[i] = nums[i] - curr
      nums[i] -= curr
      curr += need[i]
      curr -= need[i-k+1]
    end

  end

  return true if nums[i] == 0
  false
end
