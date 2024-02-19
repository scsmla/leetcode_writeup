# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  samples = ['(', ')'].repeated_permutation(n*2).map(&:join)
  res = samples.select{|x| is_valid?(x)}
  res
end

def is_valid?(string)
  stack = []

  for i in 0..string.length-1
    if string[i] == '('
      stack << string[i]
    else
      return false if stack.empty?

      stack.pop
    end
  end

  stack.empty?
end
