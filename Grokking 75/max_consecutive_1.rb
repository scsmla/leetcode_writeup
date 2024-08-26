# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def longest_ones(nums, k)
  n = nums.length
  max = 0
  count_0 = 0
  i = 0

  while(count_0 <= k && i < n)
    count_0 += 1 if nums[i] == 0
    break if count_0 > k
    i += 1
  end

  max = [max, i].max
  j = 0

  while(i < n)
    while(j <= i && count_0 > k)
      if nums[j] == 0
        count_0 -= 1
      end

      j += 1
    end

    while(count_0 <= k && i < n)
      i += 1
      count_0 += 1 if nums[i] == 0
      max = [max, i-j+1].max if nums[i] == 1
    end
  end

  max
end
