# @param {Integer} start_value
# @param {Integer} target
# @return {Integer}
# Link: https://leetcode.com/problems/broken-calculator/description/
def broken_calc(start_value, target)
  res = 0

  while(start_value != target)
    if target <= start_value
      res += start_value - target
      break
    end
    if target % 2 == 1
      res += 1
      target += 1
    else
      target /= 2
      res += 1
    end
  end

  res
end
