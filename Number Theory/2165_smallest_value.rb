# @param {Integer} num
# @return {Integer}
# Link: https://leetcode.com/problems/smallest-value-of-the-rearranged-number/description/
def smallest_number(num)
  if num < 0
    digit = num.to_s.split('')
    digit = digit.sort.reverse
    digit.join('').to_i * -1
  elsif num > 0
    digit = num.to_s.split('')
    digit = digit.sort
    i = 0
    while(digit[i] == '0')
      i += 1
    end
    digit[i], digit[0] = digit[0], digit[i]
    digit.join('').to_i
  else
    0
  end
end
