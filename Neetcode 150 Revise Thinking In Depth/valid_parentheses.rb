# @param {String} s
# @return {Boolean}
def is_valid(s)
  #---------------------------------------------------------
  # Time complexity: O(n)
  # Space complexity: O(n)

  stack = []

  for i in 0..s.length-1
    if '([{'.include?(s[i])
      stack.push(s[i])
    else
      return false if stack.empty?
      return false if s[i] == ')' && stack[-1] != '('
      return false if s[i] == ']' && stack[-1] != '['
      return false if s[i] == '}' && stack[-1] != '{'

      stack.pop
    end
  end

  stack.empty?

  # ---------------------------------------------------------
end
