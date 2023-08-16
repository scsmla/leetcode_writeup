# @param {Integer} num
# @return {Integer[]}
# Link: https://leetcode.com/problems/closest-divisors/description/
def closest_divisors(num)
  target = num+1
  min = 10**9
  res = []

  for i in 1..Math.sqrt(target)
    if target % i == 0
      if (target/i - i) < min
        res = [i, target/i]
        min = (target/i - i)
      end
    end
  end

  target = num + 2

  for i in 1..Math.sqrt(target)
    if target % i == 0
      if (target/i - i) < min
        res = [i, target/i]
        min = (target/i - i)
      end
    end
  end

  res
end
