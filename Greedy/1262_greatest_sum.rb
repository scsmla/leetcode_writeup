# @param {Integer[]} nums
# @return {Integer}
# Link: https://leetcode.com/problems/greatest-sum-divisible-by-three/description/
def max_sum_div_three(nums)
  nums = nums.sort
  curr_sum = nums.sum
  return curr_sum if curr_sum % 3 == 0

  mod_1 = 0
  mod_2 = 0
  max = 0

  if curr_sum % 3 == 1
    for i in 0..nums.length-1
      if nums[i] % 3 == 1
        mod_1 += nums[i] if mod_1 == 0
      elsif nums[i] % 3 == 2
        mod_2 += nums[i] if mod_2 % 3 != 1
      end

      if mod_1 % 3 == 1
        max = [curr_sum - mod_1, max].max
      end

      if mod_2 % 3 == 1
         max = [curr_sum - mod_2, max].max
      end

      break if mod_2 % 3 == 1 && mod_1 % 3 == 1
    end
  else
    for i in 0..nums.length-1
      if nums[i] % 3 == 1
        mod_1 += nums[i] if mod_1 % 3 != 2
      elsif nums[i] % 3 == 2
        mod_2 += nums[i] if mod_2 == 0
      end

      if mod_1 % 3 == 2
        max = [curr_sum - mod_1, max].max
      end

      if mod_2 % 3 == 2
        max = [curr_sum - mod_2, max].max
      end

      break if mod_1 % 3 == 2 && mod_2 % 3 == 2
    end
  end

  max
end
