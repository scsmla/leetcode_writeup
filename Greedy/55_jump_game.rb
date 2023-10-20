# Link: https://leetcode.com/problems/jump-game/

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  n = nums.length
  curr_max = 0
  prev_max = -1
  prev = 0
  while(prev <= n - 1)
    prev_max = curr_max

    for i in prev..[prev+nums[prev], n-1].min
      if i + nums[i] > curr_max
        prev = i
        curr_max = i + nums[i]
      end
    end

    return true if curr_max >= n-1
    return false if curr_max == prev_max
  end

  true
end
