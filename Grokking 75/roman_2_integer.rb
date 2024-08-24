# @param {String} s
# @return {Integer}
def roman_to_int(s)
  sum = 0
  idx = 0

  while(idx <= s.length-1)
    if idx <= s.length-2 &&  s[idx] == 'I' && s[idx+1] == 'V'
      sum += 4
      idx += 2
    elsif idx <= s.length-2 && s[idx] == 'I' && s[idx+1] == 'X'
      sum += 9
      idx += 2
    elsif idx <= s.length-2 && s[idx] == 'X' && s[idx+1] == 'L'
      sum += 40
      idx += 2
    elsif idx <= s.length-2 && s[idx] == 'X' && s[idx+1] == 'C'
      sum += 90
      idx += 2
    elsif idx <= s.length-2 && s[idx] == 'C' && s[idx+1] == 'D'
      sum += 400
      idx += 2
    elsif idx <= s.length-2 && s[idx] == 'C' && s[idx+1] == 'M'
      sum += 900
      idx += 2
    elsif s[idx] == 'I'
      sum += 1
      idx += 1
    elsif s[idx] == 'V'
      sum += 5
      idx += 1
    elsif s[idx] == 'X'
      sum += 10
      idx += 1
    elsif s[idx] == 'L'
      sum += 50
      idx += 1
    elsif s[idx] == 'C'
      sum += 100
      idx += 1
    elsif s[idx] == 'D'
      sum += 500
      idx += 1
    elsif s[idx] == 'M'
      sum += 1000
      idx += 1
    end
  end

  sum
end
