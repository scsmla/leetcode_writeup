# @param {Integer[]} rolls
# @param {Integer} mean
# @param {Integer} n
# @return {Integer[]}
# Link: https://leetcode.com/problems/find-missing-observations/description/

def missing_rolls(rolls, mean, n)
  num_of_rolls = rolls.length
  total = mean * (num_of_rolls + n)
  need = total - rolls.sum
  return [] if need > n * 6 || need < n

  result = Array.new(n, 1)
  need -= n

  for i in 0..n-1
    break if need <= 0
    result[i] = [6, need+1].min
    need -= (result[i] - 1)
  end

  result
end
