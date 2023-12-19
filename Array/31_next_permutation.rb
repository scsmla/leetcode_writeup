# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
# Link: https://leetcode.com/problems/next-permutation/description/
def next_permutation(nums)
  n = nums.length
  return nums if n == 1

  for i in (n-2).downto(0)
    break if nums[i] < nums[i+1]
  end

  if i == 0 && nums[0] >= nums[1]
    nums.sort!
  else
    min_greater = 100
    min_index = n-1

    for j in (n-1).downto(i+1)
      if nums[j] > nums[i]
        if nums[j] < min_greater
          min_greater = nums[j]
          min_index = j
        end
      end
    end

    # puts i
    # puts min_index

    nums[i], nums[min_index] = nums[min_index], nums[i]
    # print nums
    nums[i+1..-1] = nums[i+1..-1].sort
    # print nums
  end
end
