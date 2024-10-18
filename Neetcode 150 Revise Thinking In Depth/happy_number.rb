# @param {Integer} n
# @return {Boolean}
# Time complexity: O(logn)
# Space complexity: O(logn)
def is_happy(n)
  hash = Hash.new

  while(true)
    hash[n] = 1
    n = n.to_s.chars.map{|x| x.to_i ** 2}.sum
    return true if n == 1
    return false if 1 == hash[n].to_i
  end
end

# Time complexity: O(logn)
# Space complexity: O(1)

def is_happy(n)
  slow, fast = n, n

  loop do
    slow = digit_square_sum(slow)
    fast = digit_square_sum(digit_square_sum(fast))
    break if slow == fast
  end

  return slow == 1
end

def digit_square_sum(n)
  res = 0

  while(n > 0)
    tmp = n % 10
    res += tmp ** 2
    n /= 10
  end

  res
end
