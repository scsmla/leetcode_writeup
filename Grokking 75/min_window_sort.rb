# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
  temp = nums.sort
  n = nums.length
  return 0 if n == 1

  for i in 0..n-1
    break if nums[i] != temp[i]
  end

  for j in (n-1).downto(0)
    break if nums[j] != temp[j]
  end

  [j - i + 1, 0].max
end
