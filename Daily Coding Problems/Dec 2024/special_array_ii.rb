# @param {Integer[]} nums
# @param {Integer[][]} queries
# @return {Boolean[]}

def is_array_special(nums, queries)
  n = nums.length
  m = queries.length
  temp = [0]
  curr = 0

  for i in 1..n-1
    curr += (nums[i] % 2 - nums[i-1] % 2).abs
    temp << curr
  end

  res = []

  for j in 0..m-1
    left, right = queries[j]

    if right - left == temp[right] - temp[left]
      res << true
    else
      res << false
    end
  end

  res
end
