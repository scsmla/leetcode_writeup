# @param {String} expression
# @return {Boolean}
def parse_bool_expr(expression)
  stack = []

  for i in 0..expression.length-1
    c = expression[i]

    if c == ')'
      seen = Set.new

      while(stack[-1] != '(')
        seen.add(stack.pop)
      end
      stack.pop

      operator = stack.pop
      if operator == '&'
        stack.push(seen.include?('f') ? 'f' : 't')
      elsif operator == '|'
        stack.push(seen.include?('t') ? 't' : 'f')
      else
        stack.push(seen.include?('t') ? 'f' : 't')
      end
    elsif c != ','
      stack << c
    end
  end

  stack.pop == 't'
end
