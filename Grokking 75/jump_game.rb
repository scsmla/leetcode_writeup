# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  n = nums.length
  cover = Array.new(n+1, 0)
  cover[0] = 1

  for i in 0..n-1
    next if nums[i] == 0

    curr = nums[i]
    cover[[i+1, n].min] += 1
    cover[[i+curr+1, n].min] += -1
  end

  curr = 0

  for i in 1..n-1
    curr += cover[i]

    return false if curr < 1
  end

  true
end
