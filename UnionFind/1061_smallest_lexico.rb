# @param {String} s1
# @param {String} s2
# @param {String} base_str
# @return {String}
# Link: https://leetcode.com/problems/lexicographically-smallest-equivalent-string/description/
def smallest_equivalent_string(s1, s2, base_str)
  @uf = Hash.new

  for i in 0..s1.length-1
    union(s1[i], s2[i])
  end

  res = ""

  for i in 0..base_str.length-1
    res.concat(find(base_str[i]))
  end

  res
end

def find(x)
  if @uf[x].nil?
    @uf[x] = x
  end

  if x != @uf[x]
    @uf[x] = find(@uf[x])
  end

  return @uf[x]
end

def union(x, y)
  par_x = find(x)
  par_y = find(y)

  if par_x > par_y
    @uf[par_x] = par_y
  else
    @uf[par_y] = par_x
  end
end
