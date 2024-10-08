# @param {String} s
# @return {String}
def shortest_palindrome(s)
  rev = s.reverse

  return '' if s.empty?

  for i in 0..s.length
    if s.start_with?(rev[i..-1])
      if i-1 >= 0
        return rev[0..i-1] + s
      else
        return s
      end
    end
  end
end
