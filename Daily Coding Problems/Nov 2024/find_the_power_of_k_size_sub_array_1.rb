# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def results_array(nums, k)
  n = nums.length
  res = []
  cnt = 0

  for i in 0..n-1
    if i == 0
      cnt += 1
    else
      if nums[i] - nums[i-1] == 1
        cnt += 1
      else
        cnt = 0
      end
    end

    if i >= k-1
      if cnt >= k -1
        res << nums[i]
      else
        res << -1
      end
    end
  end

  res
end
