# @param {Integer[]} skills
# @param {Integer} k
# @return {Integer}
def find_winning_player(skills, k)
  n = skills.length
  return skills.find_index(skills.max) if k >= n-1

  next_greater = Array.new(n, 0)
  next_greater[n-1] = n
  stack = [n-1]

  for i in (n-2).downto(0)
    if stack.empty?
      next_greater[i] = n
    else
      while(!stack.empty? && skills[stack[-1]] < skills[i])
        stack.pop
      end

      if stack.empty?
        next_greater[i] = n
      else
        next_greater[i] = stack[-1]
      end
    end

    stack.push(i)
  end

  max_num = skills.max
  return 0 if skills[0] == max_num || next_greater[0] - 1 >= k
  curr_max = skills[0]

  for i in 1..n-1
    return i if skills[i] == max_num
    next if curr_max > skills[i]
    curr_max = [curr_max, skills[i]].max

    return i if next_greater[i] - i >= k
  end
end
