# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(target, nums)
  min = 10 ** 6
  n = nums.length
  left, right = 0, 0
  curr = 0

  while(right < n)
    curr += nums[right]

    while(curr >= target)
      min = [min, right-left+1].min
      curr -= nums[left]
      left += 1
    end

    right += 1
  end

  min == 10 ** 6 ? 0 : min
end
