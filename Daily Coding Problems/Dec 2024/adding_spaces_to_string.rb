# @param {String} s
# @param {Integer[]} spaces
# @return {String}
def add_spaces(s, spaces)
  temp = ""
  j = 0

  for i in 0..s.length-1
    if i == spaces[j]
      temp << " "
      j += 1
    end

    temp << s[i]
  end

  temp
end
