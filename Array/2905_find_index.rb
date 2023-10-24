# @param {Integer[]} nums
# @param {Integer} index_difference
# @param {Integer} value_difference
# @return {Integer[]}
# Link: https://leetcode.com/problems/find-indices-with-index-and-value-difference-ii/
def find_indices(nums, index_difference, value_difference)
  n = nums.length
  min_idx = 0
  max_idx = 0

  min_to_left = Array.new(n, 0)
  max_to_left = Array.new(n, 0)
  min_to_right = Array.new(n, 0)
  max_to_right = Array.new(n, 0)

  curr_min = nums[0]
  curr_max = nums[0]

  for i in 0..nums.length-1
    curr_min = [nums[i], curr_min].min
    curr_max = [nums[i], curr_max].max

    min_to_left[i] = curr_min
    max_to_left[i] = curr_max
  end

  curr_min = nums[-1]
  curr_max = nums[-1]

  for i in (n-1).downto(0)
    curr_min = [nums[i], curr_min].min
    curr_max = [nums[i], curr_max].max

    min_to_right[i] = curr_min
    max_to_right[i] = curr_max
  end

  first_idx = -1
  second_idx = -1
  target_value = -1

  for i in 0..nums.length-1
    if i >= index_difference
      if nums[i] - min_to_left[i-index_difference] >= value_difference
        first_idx = i
        target_value = min_to_left[i-index_difference]
        break
      end

      if max_to_left[i-index_difference] - nums[i] >= value_difference
        first_idx = i
        target_value = max_to_left[i-index_difference]
        break
      end
    end

    if i + index_difference <= n-1
      if nums[i] - min_to_right[i + index_difference] >= value_difference
        first_idx = i
        target_value = min_to_right[i + index_difference]
        # puts 'AAA'
        break
      end

      if max_to_right[i + index_difference] - nums[i] >= value_difference
        first_idx = i
        target_value = max_to_right[i + index_difference]
        # puts 'BBB'
        break
      end
    end
  end

  return [-1, -1] if first_idx == -1

  for i in 0..n-1
    if nums[i] == target_value && (i-first_idx).abs >= index_difference
      second_idx = i
      break
    end
  end

  return [first_idx, second_idx]
end
