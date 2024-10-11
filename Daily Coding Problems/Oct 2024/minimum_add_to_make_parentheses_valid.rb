# @param {String} s
# @return {Integer}
def min_add_to_make_valid(s)
  stack = []
  count = 0

  for i in 0..s.length-1
    if s[i] == '('
      stack.push(s[i])
    else
      if stack.empty?
        count += 1
      else
        stack.pop
      end
    end
  end

  count + stack.length
end
