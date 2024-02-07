# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []

  for i in 0..s.length-1
    if s[i] == ')'
      return false if stack[-1] != '('
      stack.pop
    elsif s[i] == ']'
      return false if stack[-1] != '['
      stack.pop
    elsif s[i] == '}'
      return false if stack[-1] != '{'
      stack.pop
    else
      stack.push(s[i])
    end
  end

  stack.empty?
end
