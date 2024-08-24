# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  n = nums.length
  return 0 if n <= 1

  i = 1
  count = 1
  max = nums[0]

  while(max < n-1)
    new_max = max

    for j in i..max
      new_max = [new_max, j + nums[j]].max
    end

    i = max+1
    max = new_max
    count += 1
  end

  count
end
