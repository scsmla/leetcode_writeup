# @param {String} s
# @return {String}
def clear_digits(s)
  stack = []
  digits = []
  for i in 0..s.length-1
    if s[i].ord <= 57
      if !stack.empty?
        stack.pop
      else
        digits << s[i]
      end
    else
      stack << s[i]
    end
  end

  digits.join('') + stack.join('')
end
