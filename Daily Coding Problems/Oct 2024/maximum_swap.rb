# @param {Integer} num
# @return {Integer}
def maximum_swap(num)
  digit = num.to_s.chars.sort.reverse
  num_s = num.to_s

  for i in 0..num_s.length-1
    if num_s[i] != digit[i]
      for j in (num_s.length-1).downto(0)
        if num_s[j] == digit[i]
          num_s[i], num_s[j] = num_s[j], num_s[i]
          return num_s.to_i
        end
      end
    end
  end

  return num
end
