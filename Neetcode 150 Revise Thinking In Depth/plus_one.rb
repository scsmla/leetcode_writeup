# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  n = digits.length
  prev = 1

  for i in (n-1).downto(0)
    digits[i] = prev + digits[i]
    if digits[i] >= 10
      prev = 1
      digits[i] = 0
    else
      prev = 0
      break
    end
  end

  digits.unshift(1) if prev > 0
  digits
end
