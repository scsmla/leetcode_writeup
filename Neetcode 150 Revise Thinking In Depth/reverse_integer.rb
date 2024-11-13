# @param {Integer} x
# @return {Integer}
# Time complexity: O(logx)
# Space complexity: O(1)
def reverse(x)
  is_neg = false

  if x < 0
    is_neg = true
    x *= -1
  end

  res = 0

  while(x > 0)
    remainder = x % 10
    res = res * 10 + remainder
    x /= 10
  end

  return 0 if res > 2 ** 31 - 1
  is_neg ? res * -1 : res
end
