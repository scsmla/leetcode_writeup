# @param {String} s
# @return {Integer}
def minimum_steps(s)
  n = s.length
  one_indices = []

  for i in 0..s.length-1
    one_indices << i if s[i] == '1'
  end

  res = 0

  for i in 0..one_indices.length-1
    res += (n-i-1) - one_indices[one_indices.length-1-i]
  end

  res
end
