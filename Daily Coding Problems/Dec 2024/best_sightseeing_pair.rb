# @param {Integer[]} values
# @return {Integer}
def max_score_sightseeing_pair(values)
  n = values.length
  max = values[0] + 0
  res = 0

  for i in 1..n-1
    res = [max + values[i] - i, res].max
    max = [max, values[i] + i].max
  end

  res
end
