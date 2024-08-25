# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  n = nums.length
  c_0, c_1, c_2 = 0, 0, 0

  for i in 0..n-1
    c_0 += 1 if nums[i] == 0
    c_1 += 1 if nums[i] == 1
    c_2 += 1 if nums[i] == 2
  end

  i = 0
  while(i < n)
    while(i < c_0)
      nums[i] = 0
      i += 1
    end

    while(i < c_0 + c_1)
      nums[i] = 1
      i += 1
    end

    while(i < c_0 + c_1 + c_2)
      nums[i] = 2
      i += 1
    end
  end
end
