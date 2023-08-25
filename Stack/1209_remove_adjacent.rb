# @param {String} s
# @param {Integer} k
# @return {String}
# Link: https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
def remove_duplicates(s, k)
  stack = []
  stack_l = []
  curr = 1

  for i in 0..s.length-1
    stack << s[i]
    n = stack.length

    if n >= 2 && stack[-1] == stack[-2]
      curr += 1
    else
      stack_l << curr
      curr = 1
    end

    if n >= k
      if curr >= k
        j = 0

        while(j < k)
          stack.pop
          j += 1
        end

        curr = stack_l.pop || 1
      end
    end
  end

  stack.join('')
end
