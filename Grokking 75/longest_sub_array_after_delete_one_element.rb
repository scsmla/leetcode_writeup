# @param {Integer[]} nums
# @return {Integer}
def longest_subarray(nums)
  n = nums.length
  right, left = 0, 0
  count_0 = 0
  max = 0

  while(right < n)
    if nums[right] == 0
      count_0 += 1
    end

    while(count_0 > 1)
      if nums[left] == 0
        count_0 -= 1
      end

      left += 1
    end

    max = [max, right-left].max
    right += 1
  end

  max
end
