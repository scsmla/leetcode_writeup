# @param {String} a
# @param {String} b
# @param {String} c
# @return {String}
# Link: https://leetcode.com/problems/shortest-string-that-contains-three-strings/
def minimum_string(a, b, c)
  combo = [a,b,c].permutation(3).to_a
  n = (a + b + c).length
  min = 'z' * n

  for i in 0..combo.length-1
    f, s, t = combo[i]
    curr = f

    # print combo[i]
    # puts ''

    # puts curr
    if !curr.include?(s)
      start = false
      for j in 0..curr.length-1
        if s.start_with?(curr[j..-1])
          start = true
          break
        end
      end

      if start
        if curr.length - j < s.length
          curr += s[curr.length-j..-1]
        end
      else
        curr += s
      end
    end

    # puts curr

    if !curr.include?(t)
      start = false
      for j in 0..curr.length-1
        if t.start_with?(curr[j..-1])
          start = true
          break
        end
      end

      if start
        if curr.length - j < t.length
          curr += t[curr.length - j ..-1]
        end
      else
        curr += t
      end
    end

    # puts curr
    # puts '----'

    if curr.length < min.length
      min = curr
    elsif curr.length == min.length
      min = [min, curr].min
    end
  end

  min
end
