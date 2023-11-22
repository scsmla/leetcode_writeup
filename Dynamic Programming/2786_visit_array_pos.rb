# @param {Integer[]} nums
# @param {Integer} x
# @return {Integer}
# Link: https://leetcode.com/problems/visit-array-positions-to-maximize-score/description/
def max_score(nums, x)
  n = nums.length
  max_e = 0
  max_o = 0

  for i in 0..n-1
    if nums[i] % 2 == nums[0] % 2
      if nums[i] % 2 == 0
        max_e += nums[i]
      else
        max_o += nums[i]
      end
    else
      break
    end
  end

  if nums[0] % 2 == 0
    max_o = -10**10
  else
    max_e = -10**10
  end

  return [max_o, max_e].max if i == n-1 && nums[i] % 2 == nums[0] % 2

  for j in i..n-1
    if nums[j] % 2 == 1
      max_o = [max_e + nums[j] - x, max_o + nums[j]].max
    else
      max_e = [max_o + nums[j] - x, max_e + nums[j]].max
    end

    max = [max_o, max_e].max
  end

  [max_o, max_e].max
end
