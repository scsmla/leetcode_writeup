# @param {Integer[]} rolls
# @param {Integer} mean
# @param {Integer} n
# @return {Integer[]}
# Link: https://leetcode.com/problems/find-missing-observations/
def missing_rolls(rolls, mean, n)
  m = rolls.length
  sum = mean*(n+m)
  return [] if sum - rolls.sum > 6 * n || sum - rolls.sum < n

  res = Array.new(n, (sum-rolls.sum)/n)
  remain = (sum-rolls.sum)%n
  for i in 0..remain-1
    res[i] += 1
  end

  res
end
