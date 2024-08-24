# @param {Integer} l
# @param {Integer} r
# @return {Integer}
# https://leetcode.com/problems/find-the-count-of-numbers-which-are-not-special/

def non_special_count(l, r)
  max_num = Math.sqrt(r).floor
  min_num = Math.sqrt(l).ceil
  count = 0

  for i in min_num..max_num
    count += 1 if is_prime(i)
  end

  r-l+1 - count
end

def is_prime(num)
  return false if num == 1

  for j in 2..Math.sqrt(num).floor
    return false if num % j == 0
  end

  true
end
