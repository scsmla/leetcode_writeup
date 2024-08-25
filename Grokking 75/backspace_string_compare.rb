# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  s_1 = []

  for i in 0..s.length-1
    if s[i] == '#'
      s_1.pop
    else
      s_1 << s[i]
    end
  end

  t_1 = []

  for i in 0..t.length-1
    if t[i] == '#'
      t_1.pop
    else
      t_1 << t[i]
    end
  end

  s_1.join('') == t_1.join('')
end
