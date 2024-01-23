# Link: https://leetcode.com/problems/product-of-array-except-self/description/
# @param {Integer[]} nums
# @return {Integer[]}

def product_except_self(nums)
  prod = 1
  n = nums.length
  c_0 = 0
  prefix = Array.new(n, 1)
  suffix = Array.new(n, 1)
  c_p = 1
  c_s = 1

  for i in 0..n-1
    if i > 0
      prefix[i-1] = c_p
    end

    c_p *= nums[i]
  end

  for i in (n-1).downto(0)
    if i < n-1
      suffix[i+1] = c_s
    end

    c_s *= nums[i]
  end

  res = []

  for i in 0..n-1
    c = 1
    c *= i > 0 ? prefix[i-1] : 1
    c *= i < n-1 ? suffix[i+1] : 1
    res << c
  end

  res
end
