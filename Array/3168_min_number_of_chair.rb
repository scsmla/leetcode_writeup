# @param {String} s
# @return {Integer}
def minimum_chairs(s)
  curr = 0
  max = 0

  for i in 0..s.length-1
    if s[i] == 'E'
      curr += 1
    else
      curr -= 1
    end

    max = [max, curr].max
  end

  max
end
