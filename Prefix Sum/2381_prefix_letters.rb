# @param {String} s
# @param {Integer[][]} shifts
# @return {String}
# Link: https://leetcode.com/problems/shifting-letters-ii/description/
def shifting_letters(s, shifts)
  n = s.length
  p_sum = Array.new(n+1, 0)
  for i in 0..shifts.length-1
    from, to, direction = shifts[i]
    if direction == 1
      p_sum[from] += 1
      p_sum[to+1] -= 1
    else
      p_sum[from] -= 1
      p_sum[to+1] += 1
    end
  end

  for i in 0..s.length-1
    p_sum[i] += p_sum[i-1] if i > 0
    move =
      if p_sum[i] != 0
        p_sum[i].abs % 26 * (p_sum[i].abs/p_sum[i])
      else
        0
      end
    if s[i].ord + move <= 122 && s[i].ord + move >= 97
      s[i] = (s[i].ord + move).chr
    elsif s[i].ord + move < 97
      s[i] = (122 - (96-s[i].ord-move)).chr
    else
      s[i] = (97 + (s[i].ord+move-123)).chr
    end
  end

  s
end
