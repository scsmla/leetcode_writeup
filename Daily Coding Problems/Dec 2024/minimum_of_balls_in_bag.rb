# @param {Integer[]} nums
# @param {Integer} max_operations
# @return {Integer}
def minimum_size(nums, max_operations)
  n = nums.length
  l = 1
  r = nums.max

  while(l < r)
    mid = (l + r) / 2
    if valid?(mid, nums, max_operations)
      r = mid
    else
      l = mid + 1
    end
  end

  l
end

def valid?(curr, nums, max_operations)
  n = nums.length
  count = 0

  nums.each do |num|
    count += (num.to_f / curr).ceil - 1

    return false if count > max_operations
  end

  true
end
