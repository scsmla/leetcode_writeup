# @param {Integer[]} nums
# @return {Integer}
def max_sum_min_product(nums)
  n = nums.length
  left = Array.new(n, 0)
  right = Array.new(n, 0)
  stack = []

  for i in 0..n-1
    while(!stack.empty? && nums[stack[-1]] >= nums[i])
      stack.pop
    end

    if stack.empty?
      left[i] = 0
    else
      left[i] = stack[-1] + 1
    end

    stack << i
  end

  stack = []

  for i in (n-1).downto(0)
    while(!stack.empty? && nums[stack[-1]] >= nums[i])
      stack.pop
    end

    if stack.empty?
      right[i] = n-1
    else
      right[i] = stack[-1] - 1
    end

    stack << i
  end

  res = 0
  dp = Array.new(n, 0)
  dp[0] = nums[0]

  for i in 1..n-1
    dp[i] = dp[i-1] + nums[i]
  end

  for i in 0..n-1
    if left[i] > 0
      res = [res, nums[i] * (dp[right[i]] - dp[left[i] - 1])].max
    else
      res = [res, nums[i] * dp[right[i]] ].max
    end
  end

  res % (10 ** 9 + 7)
end
