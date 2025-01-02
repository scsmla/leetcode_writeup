# @param {String} s
# @return {Integer}
def maximum_length(s)
  n = s.length
  max = -1
  hash = Hash.new

  for i in 0..n-1
    for j in i..n-1
      curr = s[i..j]
      if curr.chars.uniq.length == 1
        hash[curr] ||= 0
        hash[curr] += 1
      end
    end
  end

  hash.each do |k, v|
    max = [max, k.length].max if v >= 3
  end

  max
end
