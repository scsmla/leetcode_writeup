# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  numbers = []
  ops = []

  for i in 0..tokens.length-1
    if is_digit?(tokens[i])
      numbers << tokens[i].to_i
    else
      val_1, val_2 = numbers.pop, numbers.pop

      if tokens[i] == '+'
        numbers << val_1 + val_2
      elsif tokens[i] == '-'
        numbers << val_2 - val_1
      elsif tokens[i] == '*'
        numbers << val_1 * val_2
      else
        numbers << val_2.fdiv(val_1).truncate
      end
    end
  end

  numbers[0]
end

def is_digit?(str)
  str.to_i.to_s == str
end
