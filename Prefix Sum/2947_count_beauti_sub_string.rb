# @param {String} s
# @param {Integer} k
# @return {Integer}
def beautiful_substrings(s, k)
  n = s.length
  c_v = Array.new(n+1, 0)
  c_c = Array.new(n+1, 0)

  count_v, count_c = 0, 0

  for i in 0..n-1
    if ['a', 'e', 'i', 'o', 'u'].include?(s[i])
      count_v += 1
    else
      count_c += 1
    end

    c_v[i+1] = count_v
    c_c[i+1] = count_c
  end

  res = 0

  for i in 1..n
    for j in 1..i
      curr_v = c_v[i] - c_v[j-1]
      curr_c = c_c[i] - c_c[j-1]

      res += 1 if curr_v == curr_c && (curr_v * curr_c) % k == 0 && curr_v > 0
    end
  end

  res
end
