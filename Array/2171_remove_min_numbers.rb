# @param {Integer[]} beans
# @return {Integer}
# Link: https://leetcode.com/problems/removing-minimum-number-of-magic-beans/description/
def minimum_removal(beans)
  beans = beans.sort
  n = beans.length
  curr = 0
  curr_sum = beans.sum
  curr_sum -= beans[0]
  p_0 = 0
  min = 10**10
  for i in 1..n-1
    p_l = curr_sum - (n-i)*beans[i]
    p_0 += beans[i-1]
    curr_sum -= beans[i]
    next if beans[i] == beans[i-1]

    min = [min, p_l + p_0].min
  end

  min = [beans.sum-beans[0]*n, min].min
  min
end
